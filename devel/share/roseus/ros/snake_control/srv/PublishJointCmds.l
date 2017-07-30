;; Auto-generated. Do not edit!


(when (boundp 'snake_control::PublishJointCmds)
  (if (not (find-package "SNAKE_CONTROL"))
    (make-package "SNAKE_CONTROL"))
  (shadow 'PublishJointCmds (find-package "SNAKE_CONTROL")))
(unless (find-package "SNAKE_CONTROL::PUBLISHJOINTCMDS")
  (make-package "SNAKE_CONTROL::PUBLISHJOINTCMDS"))
(unless (find-package "SNAKE_CONTROL::PUBLISHJOINTCMDSREQUEST")
  (make-package "SNAKE_CONTROL::PUBLISHJOINTCMDSREQUEST"))
(unless (find-package "SNAKE_CONTROL::PUBLISHJOINTCMDSRESPONSE")
  (make-package "SNAKE_CONTROL::PUBLISHJOINTCMDSRESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass snake_control::PublishJointCmdsRequest
  :super ros::object
  :slots (_rate _T _params _reset ))

(defmethod snake_control::PublishJointCmdsRequest
  (:init
   (&key
    ((:rate __rate) 0)
    ((:T __T) (instance ros::time :init))
    ((:params __params) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:reset __reset) nil)
    )
   (send-super :init)
   (setq _rate (round __rate))
   (setq _T __T)
   (setq _params __params)
   (setq _reset __reset)
   self)
  (:rate
   (&optional __rate)
   (if __rate (setq _rate __rate)) _rate)
  (:T
   (&optional __T)
   (if __T (setq _T __T)) _T)
  (:params
   (&optional __params)
   (if __params (setq _params __params)) _params)
  (:reset
   (&optional __reset)
   (if __reset (setq _reset __reset)) _reset)
  (:serialization-length
   ()
   (+
    ;; uint32 _rate
    4
    ;; duration _T
    8
    ;; float32[] _params
    (* 4    (length _params)) 4
    ;; bool _reset
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _rate
       (write-long _rate s)
     ;; duration _T
       (write-long (send _T :sec) s) (write-long (send _T :nsec) s)
     ;; float32[] _params
     (write-long (length _params) s)
     (dotimes (i (length _params))
       (sys::poke (elt _params i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; bool _reset
       (if _reset (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _rate
     (setq _rate (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; duration _T
     (send _T :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _T :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[] _params
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _params (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _params i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; bool _reset
     (setq _reset (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass snake_control::PublishJointCmdsResponse
  :super ros::object
  :slots (_header _success ))

(defmethod snake_control::PublishJointCmdsResponse
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _success __success)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass snake_control::PublishJointCmds
  :super ros::object
  :slots ())

(setf (get snake_control::PublishJointCmds :md5sum-) "a95cf7713f743cc252b964b3db9e31ef")
(setf (get snake_control::PublishJointCmds :datatype-) "snake_control/PublishJointCmds")
(setf (get snake_control::PublishJointCmds :request) snake_control::PublishJointCmdsRequest)
(setf (get snake_control::PublishJointCmds :response) snake_control::PublishJointCmdsResponse)

(defmethod snake_control::PublishJointCmdsRequest
  (:response () (instance snake_control::PublishJointCmdsResponse :init)))

(setf (get snake_control::PublishJointCmdsRequest :md5sum-) "a95cf7713f743cc252b964b3db9e31ef")
(setf (get snake_control::PublishJointCmdsRequest :datatype-) "snake_control/PublishJointCmdsRequest")
(setf (get snake_control::PublishJointCmdsRequest :definition-)
      "uint32 rate
duration T
float32[] params
bool reset
---
Header header
bool success

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

(setf (get snake_control::PublishJointCmdsResponse :md5sum-) "a95cf7713f743cc252b964b3db9e31ef")
(setf (get snake_control::PublishJointCmdsResponse :datatype-) "snake_control/PublishJointCmdsResponse")
(setf (get snake_control::PublishJointCmdsResponse :definition-)
      "uint32 rate
duration T
float32[] params
bool reset
---
Header header
bool success

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



(provide :snake_control/PublishJointCmds "a95cf7713f743cc252b964b3db9e31ef")


