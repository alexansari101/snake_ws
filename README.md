# snake_ws
ROS workspace with packages for simulated control of the CMU Biorobotics Lab's SEA snake and SEA hexapod (aka snake monster). 

Tested with __ROS Kinetic__ and __Ubuntu 16.04__

Special thanks to the [HEBI Robotics](http://hebirobotics.com/) team for providing the meshes and URDF files for their modular SEA actuators.  Howie Choset's Biorobotics lab (CMU) used these actutors to construct modular snake and heaxapod robots.  This project builds on HEBI's mesh and URDF files to develop dynamic simulations of each robot to enable testing and experimentation, e.g., of different controllers, in Gazebo.  The project implements several example controllers including a CPG-based walking controller for the SEA hexapod, and a serpenoid gait controller for the snake.

## Build and source the workspace

Source ROS if this is not already handled:
```
$ source /opt/ros/kinetic/setup.bash
```
Move to the downloaded workspace, build, and source:
```
$ cd snake_ws
$ catkin_make
$ source devel/setup.bash
```

## Example run commands

### SEA snake

Make the gaits.py script executable:
```
$ roscd snake_control/scripts/
$ sudo chmod +x gaits.py
```

Launch the gazebo simulator, ROS control interfaces, and execute gait control script: 
```
$ roslaunch snake_control gazebo.launch gait:=true paused:=false
```

*If the commands are successful, gaits.py should send joint commands that cause the snake robot simulation in gazebo to start sidewinding.  The python file publishes desired joint angles and ROS control is used to implement a PD controller to drive the dynamic robot model in tracking these angles.*

### SEA hexapod

Launch the gazebo simulator and ROS control interfaces: 
```
$ roslaunch snake_monster_control gaz_control.launch
```

Open a seperate terminal and execute a control script:
```
$ cd snake_ws/src/snake_monster_control/scripts
$ python walking_controller.py
```

*If the commands are successful, walking_controller.py should send joint commands that cause the hexapod robot simulation in gazebo to start walking.  The python file publishes desired joint angles and ROS control is used to implement a PD controller to drive the dynamic robot model in tracking these angles.*

## Acknowledgements

The snake_control and snake_monster_control packages were developed by Alex Ansari while working in Prof. Howie Choset's Biorobotics Lab at Carnegie Mellon University. (The workspace uses model files from HEBI Robotics and redistributes the gazebo_ros_control package so the workspace is self-contained.)  You are free to use this code subject to the licensing agreements in each package.  If you do use these packages, please remember to cite and properly ackowledge source materials.
