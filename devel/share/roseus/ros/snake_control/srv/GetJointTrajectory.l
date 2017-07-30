;; Auto-generated. Do not edit!


(when (boundp 'snake_control::GetJointTrajectory)
  (if (not (find-package "SNAKE_CONTROL"))
    (make-package "SNAKE_CONTROL"))
  (shadow 'GetJointTrajectory (find-package "SNAKE_CONTROL")))
(unless (find-package "SNAKE_CONTROL::GETJOINTTRAJECTORY")
  (make-package "SNAKE_CONTROL::GETJOINTTRAJECTORY"))
(unless (find-package "SNAKE_CONTROL::GETJOINTTRAJECTORYREQUEST")
  (make-package "SNAKE_CONTROL::GETJOINTTRAJECTORYREQUEST"))
(unless (find-package "SNAKE_CONTROL::GETJOINTTRAJECTORYRESPONSE")
  (make-package "SNAKE_CONTROL::GETJOINTTRAJECTORYRESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))
(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass snake_control::GetJointTrajectoryRequest
  :super ros::object
  :slots ())

(defmethod snake_control::GetJointTrajectoryRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass snake_control::GetJointTrajectoryResponse
  :super ros::object
  :slots (_header _joint_names _points ))

(defmethod snake_control::GetJointTrajectoryResponse
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:points __points) (let (r) (dotimes (i 0) (push (instance trajectory_msgs::JointTrajectoryPoint :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _joint_names __joint_names)
   (setq _points __points)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; trajectory_msgs/JointTrajectoryPoint[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string[] _joint_names
     (write-long (length _joint_names) s)
     (dolist (elem _joint_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; trajectory_msgs/JointTrajectoryPoint[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string[] _joint_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _joint_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; trajectory_msgs/JointTrajectoryPoint[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance trajectory_msgs::JointTrajectoryPoint :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass snake_control::GetJointTrajectory
  :super ros::object
  :slots ())

(setf (get snake_control::GetJointTrajectory :md5sum-) "65b4f94a94d1ed67169da35a02f33d3f")
(setf (get snake_control::GetJointTrajectory :datatype-) "snake_control/GetJointTrajectory")
(setf (get snake_control::GetJointTrajectory :request) snake_control::GetJointTrajectoryRequest)
(setf (get snake_control::GetJointTrajectory :response) snake_control::GetJointTrajectoryResponse)

(defmethod snake_control::GetJointTrajectoryRequest
  (:response () (instance snake_control::GetJointTrajectoryResponse :init)))

(setf (get snake_control::GetJointTrajectoryRequest :md5sum-) "65b4f94a94d1ed67169da35a02f33d3f")
(setf (get snake_control::GetJointTrajectoryRequest :datatype-) "snake_control/GetJointTrajectoryRequest")
(setf (get snake_control::GetJointTrajectoryRequest :definition-)
      "---
Header header
string[] joint_names
trajectory_msgs/JointTrajectoryPoint[] points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start
")

(setf (get snake_control::GetJointTrajectoryResponse :md5sum-) "65b4f94a94d1ed67169da35a02f33d3f")
(setf (get snake_control::GetJointTrajectoryResponse :datatype-) "snake_control/GetJointTrajectoryResponse")
(setf (get snake_control::GetJointTrajectoryResponse :definition-)
      "---
Header header
string[] joint_names
trajectory_msgs/JointTrajectoryPoint[] points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start
")



(provide :snake_control/GetJointTrajectory "65b4f94a94d1ed67169da35a02f33d3f")


