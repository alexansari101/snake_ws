#!/usr/bin/env python
"""listens for joint_states messages, buffers, and provides
the message as a service.
The node is derived from:
http://wiki.ros.org/pr2_controllers/Tutorials/Getting%20the%20current%20joint%20angles
"""

import rospy
from std_msgs.msg import Float64
from sensor_msgs.msg import JointState
from trajectory_msgs.msg import JointTrajectoryPoint
from snake_control.srv import *


class BufferedJointTraj:
    """ holds the latest states obtained from joint_states messages
    """
    def __init__(self):
        rospy.init_node('joint_traj_srvr')
        self.start_time = -1
        self.tm_0 = 0  # time first joint state message recorded
        self.start = 0 # [0,1,2] for red, yellow, green
        self.its = 0
        self.max_its = 1002
        self.dt = .01
        self.resp = []
        self.sub_once = rospy.Subscriber('/snake/S_00_eff_pos_controller/command', \
                                         Float64, self.onetime_callback)
        rospy.Subscriber('/snake/joint_states', JointState, self.joint_states_callback)
        s = rospy.Service('/snake/get_joint_traj', GetJointTrajectory, self.return_joint_traj)

    # run callback once to signal that buffering should begin soon
    def onetime_callback(self, Float64):
        self.start_time = rospy.Time.now()
        self.start=1 # yellow light
        print "called onetime callback at ", self.start_time.to_sec()
        self.sub_once.unregister()

    # callback function: when a joint_states message arrives, save the relevant components
    def joint_states_callback(self, msg):

        if self.start == 1 :
            self.tm_0 = rospy.Time(msg.header.stamp.secs, \
                                   msg.header.stamp.nsecs)
            
            if self.tm_0.to_sec() > self.start_time.to_sec()-self.dt :
                self.start = 2
                
                traj_pt_msg = JointTrajectoryPoint()
                (traj_pt_msg.positions, traj_pt_msg.effort) = (msg.position, msg.effort)
                traj_pt_msg.time_from_start = rospy.Duration( msg.header.stamp.secs \
                                                              - self.tm_0.secs,
                                                              msg.header.stamp.nsecs
                                                              - self.tm_0.nsecs )
                self.resp = [traj_pt_msg]
                self.its += 1
                print "appending joint_states at ", self.tm_0.to_sec()
                
        elif self.start == 2 and self.its < self.max_its :
            traj_pt_msg = JointTrajectoryPoint()
            (traj_pt_msg.positions, traj_pt_msg.effort) = (msg.position, msg.effort)
            traj_pt_msg.time_from_start = rospy.Duration( msg.header.stamp.secs \
                                                          - self.tm_0.secs,
                                                          msg.header.stamp.nsecs
                                                          - self.tm_0.nsecs )
            
            self.resp.append( traj_pt_msg )
            self.its += 1
            
        elif self.its == self.max_its:
            print "stopping joint_states_callback at ", \
                rospy.Time(msg.header.stamp.secs, msg.header.stamp.nsecs).to_sec()
            
            self.its = 0
            self.start = 0
            self.sub_once = rospy.Subscriber('/snake/S_00_eff_pos_controller/command', \
                                             Float64, self.onetime_callback)


    # server callback: returns the stored JointTrajectoryPoint messages
    def return_joint_traj(self, req):
        reply = GetJointTrajectoryResponse( )
        # while self.start > 0:
        #     print "..."
        #     rospy.sleep(.01)
        reply.header.stamp.secs = self.tm_0.secs   # store absolute start time of buffer in header
        reply.header.stamp.nsecs = self.tm_0.nsecs
        reply.points = self.resp
        return reply


# run the server
if __name__ == "__main__":

    buffjointtraj = BufferedJointTraj()

    print "joints_states_srvr started, waiting for queries"
    rospy.spin()
