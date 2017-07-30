# snake_ws
ROS workspace with packages for simulated control of the CMU Biorobotics lab's SEA snake and SEA hexapod (aka snake monster). 

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

*If the commands are successful, walking_controller.py should send joint commands that cause the hexapod robot simulation in gazebo to start walking.  The python file publishes desired joint angles and ROS control is used to implement a PD controller to drive the dynmaic robot model in tracking these angles.*

### SEA snake

Launch the gazebo simulator and ROS control interfaces: 
```
$ roslaunch snake_control gazebo.launch
```

Open a seperate terminal and execute a control script:
```
$ cd snake_ws/src/snake_control/scripts
$ python gaits.py
```

*If the commands are successful, gaits.py should send joint commands that cause the snake robot simulation in gazebo to start sidewinding.  The python file publishes desired joint angles and ROS control is used to implement a PD controller to drive the dynmaic robot model in tracking these angles.*