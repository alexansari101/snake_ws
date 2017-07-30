#ifndef MY_MOD_ROBOT_HPP
#define MY_MOD_ROBOT_HPP

#include <hardware_interface/joint_command_interface.h>
#include <hardware_interface/joint_state_interface.h>
#include <hardware_interface/robot_hw.h>

#include <iostream>

#include "ros/ros.h"
#include "gazebo_msgs/GetJointProperties.h"
#include "gazebo_msgs/ApplyJointEffort.h"
#include "geometry_msgs/Wrench.h"

class MyModRobot : public hardware_interface::RobotHW
{
public:
  // pass a dictionary of short_id : mod_name pairs
  MyModRobot( std::map<std::string,std::string> & modules ) 
    : cmd(modules.size()), pos(modules.size()), vel(modules.size()), 
      eff(modules.size()), modules_(modules)
  { 
   size_t i=0;
   for ( auto it= modules.begin(); it != modules.end(); ++it ) {

     // connect and register the joint state interface
     hardware_interface::JointStateHandle state_handle(it->second, &pos[i],
						       &vel[i], &eff[i]);
     jnt_state_interface.registerHandle(state_handle);

     // connect and register the joint position interface
     hardware_interface::JointHandle 
       pos_handle(jnt_state_interface.getHandle(it->second), &cmd[i]);
     jnt_pos_interface.registerHandle(pos_handle);

     // connect and register the joint effort interface
     hardware_interface::JointHandle 
       eff_handle(jnt_state_interface.getHandle(it->second), &cmd[i]);
     jnt_eff_interface.registerHandle(eff_handle);

     i++;
   }
   registerInterface(&jnt_state_interface);
   registerInterface(&jnt_pos_interface);
   registerInterface(&jnt_eff_interface);
  }

  void read() { // read pos, vel, eff from robot
    readSim();
    // std::cout <<"read ";
    // for ( auto &&i : pos )
    //   std::cout << i <<" ";
    // std::cout << std::endl;

  }
  void write() { // send cmd to robot
    writeSim();
    // for ( size_t i=0; i<cmd.size(); i++)
    //   pos[i]+=.5*(cmd[i]-pos[i]);

    // std::cout <<"write ";
    // for ( auto &&i : cmd )
    //   std::cout << i <<" ";
    // std::cout << std::endl;
  } 
  void readSim() {
    ros::ServiceClient client = nh_.serviceClient<
      gazebo_msgs::GetJointProperties>("/gazebo/get_joint_properties");

    gazebo_msgs::GetJointProperties srv;

    size_t i=0;
    for ( auto it= modules_.begin(); it != modules_.end(); ++it ) {
      srv.request.joint_name = it->second;

      if (client.call(srv)) { 
	pos[i] = srv.response.position[0];
	vel[i] = srv.response.rate[0];
      } else {
	ROS_ERROR("Failed to call service /gazebo/apply_joint_effort"); 
      }

      i++;
    }
  }
  void writeSim() {
    static ros::Duration d(1.0/200.);

    ros::ServiceClient client = nh_.serviceClient<
      gazebo_msgs::ApplyJointEffort>("/gazebo/apply_joint_effort");

    gazebo_msgs::ApplyJointEffort srv;

    size_t i=0;
    for ( auto it= modules_.begin(); it != modules_.end(); ++it ) {
      srv.request.joint_name = it->second;
      srv.request.effort = cmd[i];
      srv.request.duration = d;

      if (client.call(srv)) { 
      } else {
    	ROS_ERROR("Failed to call service /gazebo/apply_joint_effort"); 
      }

      i++;
    }
    
    // static ros::Publisher L1_1_pub = nh_.advertise<geometry_msgs::Wrench>
    //   ("/snake_monster/wrench", 10);

    // geometry_msgs::Wrench msg;
    // msg.force.x = 0;
    // msg.force.y = 0;
    // msg.force.z = 0;
    // msg.torque.x = 0;
    // msg.torque.y = 0;
    // msg.torque.z = cmd[0];

    // L1_1_pub.publish(msg);

    // std::cout << "write " << cmd[0] << std::endl;
  }

private:
  hardware_interface::JointStateInterface jnt_state_interface;
  hardware_interface::PositionJointInterface jnt_pos_interface;
  hardware_interface::EffortJointInterface jnt_eff_interface;
  std::vector<double> cmd;
  std::vector<double> pos;
  std::vector<double> vel;
  std::vector<double> eff;
  std::map<std::string,std::string> modules_;
  ros::NodeHandle nh_;
};

#endif
