#!/usr/bin/env python
"""spins off a thread to listen for joint_states messages and provides
the message as a service.
The node is derived from:
http://wiki.ros.org/pr2_controllers/Tutorials/Getting%20the%20current%20joint%20angles
"""

import rospy
from sensor_msgs.msg import JointState
from snake_control.srv import *
import threading


class LatestJointStates:
    """ holds the latest states obtained from joint_states messages
    """
    def __init__(self):
        rospy.init_node('joint_states_srvr')
        self.lock = threading.Lock()
        self.resp = GetJointStatesResponse()
        self.thread = threading.Thread(target=self.joint_states_listener)
        self.thread.start()

        s = rospy.Service('/snake/get_joint_states', GetJointStates, self.return_joint_states)
        

    # thread function: listen for joint_states messages
    def joint_states_listener(self):
        rospy.Subscriber('/snake/joint_states', JointState, self.joint_states_callback)
        rospy.spin()


    # callback function: when a joint_states message arrives, save the relevant components
    def joint_states_callback(self, msg):
        self.lock.acquire()
        self.resp = GetJointStatesResponse(msg.header, msg.position, msg.effort)
        self.lock.release()


    # server callback: returns the stored JointStates message
    def return_joint_states(self, req):
        return self.resp


# run the server
if __name__ == "__main__":

    latestjointstates = LatestJointStates()

    print "joints_states_srvr started, waiting for queries"
    rospy.spin()
