#include <ros/ros.h>
#include <sensor_msgs/JointState.h>

#include <vector>

int main(int argc, char** argv) {

  ros::init(argc, argv, "joint_state_publisher");
  ros::NodeHandle n;
  ros::Publisher joint_pub = 
    n.advertise<sensor_msgs::JointState>("joint_states", 1);
  ros::Rate loop_rate(100);
  
  // message declarations
  sensor_msgs::JointState joint_state;

  // load yaml map with short_id : mod_name pairs for actuated joints
  std::map<std::string,std::string> modules;
  while ( !n.getParam("/module_map", modules) )
    ros::Duration(0.5).sleep();

  size_t n_joints = modules.size();
  
  while (ros::ok()) {

    // update joint_state
    joint_state.header.stamp = ros::Time::now();
    joint_state.name.resize(n_joints);
    joint_state.position.resize(n_joints);

    size_t i=0;
    for ( auto it= modules.begin(); it != modules.end(); ++it ) {
      joint_state.name[i] = it->second;
      if (i % 3 == 0) {
    	joint_state.position[i] = sin( joint_state.header.stamp.toSec() );
    	if ( i < 9 )
    	  joint_state.position[i] = -joint_state.position[i];
      }
      else if (i % 3 == 1)
    	joint_state.position[i] = .5*cos( joint_state.header.stamp.toSec() );
      else if (i % 3 == 2)
    	joint_state.position[i] = -.5*cos( joint_state.header.stamp.toSec() );
      else
    	joint_state.position[i] = 0;
      i++;
    }
    
    // send the joint state and transform
    joint_pub.publish(joint_state);
    
    // This will adjust as needed per iteration
    loop_rate.sleep();
  }
  
  
  return 0;
}
