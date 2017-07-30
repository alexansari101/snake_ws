#include "my_mod_robot.hpp"
#include "controller_manager/controller_manager.h"
#include "hardware_interface/actuator_state_interface.h"

#include <ros/callback_queue.h>


int main(int argc, char** argv)
{
  ros::init(argc, argv, "snake_monster_iface");
  ros::NodeHandle nh;
  ros::CallbackQueue queue;
  nh.setCallbackQueue(&queue);

  std::map<std::string,std::string> modules;
  while ( !nh.getParam("/module_map", modules) )
    ros::Duration(0.5).sleep();

  MyModRobot snake_monster( modules );


  controller_manager::ControllerManager cm(&snake_monster,nh);

  ros::AsyncSpinner spinner(4, &queue);
  spinner.start();

  ros::Time ts = ros::Time::now();

  ros::Rate rate(100);
  while (ros::ok())
  {
     ros::Duration d = ros::Time::now() - ts;
     ts = ros::Time::now();
     snake_monster.read();
     cm.update(ts, d);
     snake_monster.write();
     rate.sleep();
  }

  spinner.stop();

  return 0;
}
