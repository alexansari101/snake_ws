#include "ros/ros.h"
#include "std_msgs/Float64.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, "control_messager");
  ros::NodeHandle nh;
 
  ros::Publisher L1_1_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L1_1_eff_pos_controller/command", 100);
  ros::Publisher L1_2_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L1_2_eff_pos_controller/command", 100);
  ros::Publisher L1_3_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L1_3_eff_pos_controller/command", 100);
  ros::Publisher L2_1_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L2_1_eff_pos_controller/command", 100);
  ros::Publisher L2_2_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L2_2_eff_pos_controller/command", 100);
  ros::Publisher L2_3_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L2_3_eff_pos_controller/command", 100);
  ros::Publisher L3_1_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L3_1_eff_pos_controller/command", 100);
  ros::Publisher L3_2_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L3_2_eff_pos_controller/command", 100);
  ros::Publisher L3_3_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L3_3_eff_pos_controller/command", 100);
  ros::Publisher L4_1_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L4_1_eff_pos_controller/command", 100);
  ros::Publisher L4_2_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L4_2_eff_pos_controller/command", 100);
  ros::Publisher L4_3_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L4_3_eff_pos_controller/command", 100);
  ros::Publisher L5_1_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L5_1_eff_pos_controller/command", 100);
  ros::Publisher L5_2_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L5_2_eff_pos_controller/command", 100);
  ros::Publisher L5_3_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L5_3_eff_pos_controller/command", 100);
  ros::Publisher L6_1_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L6_1_eff_pos_controller/command", 100);
  ros::Publisher L6_2_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L6_2_eff_pos_controller/command", 100);
  ros::Publisher L6_3_pub = nh.advertise<std_msgs::Float64>
    ("/snake_monster/L6_3_eff_pos_controller/command", 100);

  ros::Rate loop_rate(200);

  while (ros::ok())
  {
    std_msgs::Float64 msg;

    msg.data = 0;// sin( ros::Time::now().toSec() );

    L1_1_pub.publish(msg);
    L1_2_pub.publish(msg);
    L1_3_pub.publish(msg);
    L2_1_pub.publish(msg);
    L2_2_pub.publish(msg);
    L2_3_pub.publish(msg);
    L3_1_pub.publish(msg);
    L3_2_pub.publish(msg);
    L3_3_pub.publish(msg);    
    L4_1_pub.publish(msg);
    L4_2_pub.publish(msg);
    L4_3_pub.publish(msg);
    L5_1_pub.publish(msg);
    L5_2_pub.publish(msg);
    L5_3_pub.publish(msg);
    L6_1_pub.publish(msg);
    L6_2_pub.publish(msg);
    L6_3_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
  }


  return 0;
}
