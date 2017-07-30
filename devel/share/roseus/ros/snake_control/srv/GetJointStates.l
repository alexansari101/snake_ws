;; Auto-generated. Do not edit!


(when (boundp 'snake_control::GetJointStates)
  (if (not (find-package "SNAKE_CONTROL"))
    (make-package "SNAKE_CONTROL"))
  (shadow 'GetJointStates (find-package "SNAKE_CONTROL")))
(unless (find-package "SNAKE_CONTROL::GETJOINTSTATES")
  (make-package "SNAKE_CONTROL::GETJOINTSTATES"))
(unless (find-package "SNAKE_CONTROL::GETJOINTSTATESREQUEST")
  (make-package "SNAKE_CONTROL::GETJOINTSTATESREQUEST"))
(unless (find-package "SNAKE_CONTROL::GETJOINTSTATESRESPONSE")
  (make-package "SNAKE_CONTROL::GETJOINTSTATESRESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass snake_control::GetJointStatesRequest
  :super ros::object
  :slots ())

(defmethod snake_control::GetJointStatesRequest
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

(defclass snake_control::GetJointStatesResponse
  :super ros::object
  :slots (_header _position _effort ))

(defmethod snake_control::GetJointStatesResponse
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:effort __effort) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _position __position)
   (setq _effort __effort)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:effort
   (&optional __effort)
   (if __effort (setq _effort __effort)) _effort)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _position
    (* 8    (length _position)) 4
    ;; float64[] _effort
    (* 8    (length _effort)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _effort
     (write-long (length _effort) s)
     (dotimes (i (length _effort))
       (sys::poke (elt _effort i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _effort
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _effort (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _effort i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass snake_control::GetJointStates
  :super ros::object
  :slots ())

(setf (get snake_control::GetJointStates :md5sum-) "bc3247c2ebdce0b3b92a25e3910af17e")
(setf (get snake_control::GetJointStates :datatype-) "snake_control/GetJointStates")
(setf (get snake_control::GetJointStates :request) snake_control::GetJointStatesRequest)
(setf (get snake_control::GetJointStates :response) snake_control::GetJointStatesResponse)

(defmethod snake_control::GetJointStatesRequest
  (:response () (instance snake_control::GetJointStatesResponse :init)))

(setf (get snake_control::GetJointStatesRequest :md5sum-) "bc3247c2ebdce0b3b92a25e3910af17e")
(setf (get snake_control::GetJointStatesRequest :datatype-) "snake_control/GetJointStatesRequest")
(setf (get snake_control::GetJointStatesRequest :definition-)
      "



















---
Header header

float64[] position

float64[] effort


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
")

(setf (get snake_control::GetJointStatesResponse :md5sum-) "bc3247c2ebdce0b3b92a25e3910af17e")
(setf (get snake_control::GetJointStatesResponse :datatype-) "snake_control/GetJointStatesResponse")
(setf (get snake_control::GetJointStatesResponse :definition-)
      "



















---
Header header

float64[] position

float64[] effort


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
")



(provide :snake_control/GetJointStates "bc3247c2ebdce0b3b92a25e3910af17e")


