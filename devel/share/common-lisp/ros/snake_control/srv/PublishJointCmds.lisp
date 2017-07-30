; Auto-generated. Do not edit!


(cl:in-package snake_control-srv)


;//! \htmlinclude PublishJointCmds-request.msg.html

(cl:defclass <PublishJointCmds-request> (roslisp-msg-protocol:ros-message)
  ((rate
    :reader rate
    :initarg :rate
    :type cl:integer
    :initform 0)
   (T
    :reader T
    :initarg :T
    :type cl:real
    :initform 0)
   (params
    :reader params
    :initarg :params
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (reset
    :reader reset
    :initarg :reset
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PublishJointCmds-request (<PublishJointCmds-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PublishJointCmds-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PublishJointCmds-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snake_control-srv:<PublishJointCmds-request> is deprecated: use snake_control-srv:PublishJointCmds-request instead.")))

(cl:ensure-generic-function 'rate-val :lambda-list '(m))
(cl:defmethod rate-val ((m <PublishJointCmds-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_control-srv:rate-val is deprecated.  Use snake_control-srv:rate instead.")
  (rate m))

(cl:ensure-generic-function 'T-val :lambda-list '(m))
(cl:defmethod T-val ((m <PublishJointCmds-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_control-srv:T-val is deprecated.  Use snake_control-srv:T instead.")
  (T m))

(cl:ensure-generic-function 'params-val :lambda-list '(m))
(cl:defmethod params-val ((m <PublishJointCmds-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_control-srv:params-val is deprecated.  Use snake_control-srv:params instead.")
  (params m))

(cl:ensure-generic-function 'reset-val :lambda-list '(m))
(cl:defmethod reset-val ((m <PublishJointCmds-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_control-srv:reset-val is deprecated.  Use snake_control-srv:reset instead.")
  (reset m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PublishJointCmds-request>) ostream)
  "Serializes a message object of type '<PublishJointCmds-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rate)) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'T)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'T) (cl:floor (cl:slot-value msg 'T)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'params))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'params))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reset) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PublishJointCmds-request>) istream)
  "Deserializes a message object of type '<PublishJointCmds-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'T) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'params) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'params)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:setf (cl:slot-value msg 'reset) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PublishJointCmds-request>)))
  "Returns string type for a service object of type '<PublishJointCmds-request>"
  "snake_control/PublishJointCmdsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PublishJointCmds-request)))
  "Returns string type for a service object of type 'PublishJointCmds-request"
  "snake_control/PublishJointCmdsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PublishJointCmds-request>)))
  "Returns md5sum for a message object of type '<PublishJointCmds-request>"
  "a95cf7713f743cc252b964b3db9e31ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PublishJointCmds-request)))
  "Returns md5sum for a message object of type 'PublishJointCmds-request"
  "a95cf7713f743cc252b964b3db9e31ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PublishJointCmds-request>)))
  "Returns full string definition for message of type '<PublishJointCmds-request>"
  (cl:format cl:nil "uint32 rate~%duration T~%float32[] params~%bool reset~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PublishJointCmds-request)))
  "Returns full string definition for message of type 'PublishJointCmds-request"
  (cl:format cl:nil "uint32 rate~%duration T~%float32[] params~%bool reset~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PublishJointCmds-request>))
  (cl:+ 0
     4
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'params) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PublishJointCmds-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PublishJointCmds-request
    (cl:cons ':rate (rate msg))
    (cl:cons ':T (T msg))
    (cl:cons ':params (params msg))
    (cl:cons ':reset (reset msg))
))
;//! \htmlinclude PublishJointCmds-response.msg.html

(cl:defclass <PublishJointCmds-response> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PublishJointCmds-response (<PublishJointCmds-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PublishJointCmds-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PublishJointCmds-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snake_control-srv:<PublishJointCmds-response> is deprecated: use snake_control-srv:PublishJointCmds-response instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PublishJointCmds-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_control-srv:header-val is deprecated.  Use snake_control-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <PublishJointCmds-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_control-srv:success-val is deprecated.  Use snake_control-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PublishJointCmds-response>) ostream)
  "Serializes a message object of type '<PublishJointCmds-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PublishJointCmds-response>) istream)
  "Deserializes a message object of type '<PublishJointCmds-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PublishJointCmds-response>)))
  "Returns string type for a service object of type '<PublishJointCmds-response>"
  "snake_control/PublishJointCmdsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PublishJointCmds-response)))
  "Returns string type for a service object of type 'PublishJointCmds-response"
  "snake_control/PublishJointCmdsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PublishJointCmds-response>)))
  "Returns md5sum for a message object of type '<PublishJointCmds-response>"
  "a95cf7713f743cc252b964b3db9e31ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PublishJointCmds-response)))
  "Returns md5sum for a message object of type 'PublishJointCmds-response"
  "a95cf7713f743cc252b964b3db9e31ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PublishJointCmds-response>)))
  "Returns full string definition for message of type '<PublishJointCmds-response>"
  (cl:format cl:nil "Header header~%bool success~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PublishJointCmds-response)))
  "Returns full string definition for message of type 'PublishJointCmds-response"
  (cl:format cl:nil "Header header~%bool success~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PublishJointCmds-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PublishJointCmds-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PublishJointCmds-response
    (cl:cons ':header (header msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PublishJointCmds)))
  'PublishJointCmds-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PublishJointCmds)))
  'PublishJointCmds-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PublishJointCmds)))
  "Returns string type for a service object of type '<PublishJointCmds>"
  "snake_control/PublishJointCmds")