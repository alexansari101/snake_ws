#!/usr/bin/env python
"""
The node publishes joint position commands to effort position controllers.
The controllers should already be spawned and running and communicating
with the appropriate robot hardware interface.
"""

import rospy
from std_msgs.msg import Float64

from cpg import *
import numpy as np


class JointCmds:
    """
    The class provides a dictionary mapping joints to command values.
    """
    def __init__( self ) :
        
        self.joints_list = []
        for i in xrange(6) :
            for j in xrange(3) :
                leg_str='L' + str(i+1) + '_' + str(j+1)
                self.joints_list += [leg_str]

        self.cpg_joints = ['L6_2', 'L1_2', 'L4_2', 'L3_2']
        self.group_joints = [['L1_1', 'L4_1'], ['L6_1', 'L3_1'],
                             ['L2_2', 'L5_2'], ['L2_3', 'L5_3']]
        self.group_joints_flat = [item for sublist in self.group_joints \
                                  for item in sublist]
        self.cpg = CPG()
        self.jnt_cmd_dict = {}

    def update( self, dt ) :
        s = self.cpg.simulate(dt)
        x = s[:4]
        y = s[4:]

        for i, jnt in enumerate(self.cpg_joints) :
            self.jnt_cmd_dict[jnt] = max(0.5*y[i],0)

        self.jnt_cmd_dict['L1_1'] = 0.2
        self.jnt_cmd_dict['L6_1'] = -0.2
        self.jnt_cmd_dict['L4_1'] = -.75
        self.jnt_cmd_dict['L3_1'] = .75

        self.jnt_cmd_dict['L6_1'] += \
            .45*(np.cos(np.arctan2(y[0],x[0])+np.pi)+1)
        self.jnt_cmd_dict['L1_1'] -= \
            .45*(np.cos(np.arctan2(y[1],x[1])+np.pi)+1)
        self.jnt_cmd_dict['L4_1'] += \
            .3*(np.cos(np.arctan2(y[2],x[2])+np.pi)+1)
        self.jnt_cmd_dict['L3_1'] -= \
            .3*(np.cos(np.arctan2(y[3],x[3])+np.pi)+1)

        for jnt in self.group_joints[2] :
            self.jnt_cmd_dict[jnt] = 1.57
        for jnt in self.group_joints[3] :
            self.jnt_cmd_dict[jnt] = -1.57
        
        for jnt in self.joints_list :
            if jnt not in self.cpg_joints and \
               jnt not in self.group_joints_flat :
                self.jnt_cmd_dict[jnt] = 0.0
                
        return self.jnt_cmd_dict


def publish_commands( hz ):
    pub={}
    ns_str = '/snake_monster'
    cont_str = 'eff_pos_controller'
    for i in xrange(6) :
        for j in xrange(3) :
            leg_str='L' + str(i+1) + '_' + str(j+1)
            pub[leg_str] = rospy.Publisher( ns_str + '/' + leg_str + '_'
                                            + cont_str + '/command',
                                            Float64, queue_size=10 )
    rospy.init_node('walking_controller', anonymous=True)
    rate = rospy.Rate(hz)
    jntcmds = JointCmds()
    while not rospy.is_shutdown():
        jnt_cmd_dict = jntcmds.update(1./hz)
        for jnt in jnt_cmd_dict.keys() :
            pub[jnt].publish( jnt_cmd_dict[jnt] )
        rate.sleep()


if __name__ == "__main__":
    try:
        hz = 100
        publish_commands( hz )
        # cpg = CPG()
        # dt=1./hz
        # cpg.plot(10,dt)
    except rospy.ROSInterruptException:
        pass
