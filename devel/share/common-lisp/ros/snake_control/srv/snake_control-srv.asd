
(cl:in-package :asdf)

(defsystem "snake_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
               :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "GetJointStates" :depends-on ("_package_GetJointStates"))
    (:file "_package_GetJointStates" :depends-on ("_package"))
    (:file "GetJointTrajectory" :depends-on ("_package_GetJointTrajectory"))
    (:file "_package_GetJointTrajectory" :depends-on ("_package"))
    (:file "PublishJointCmds" :depends-on ("_package_PublishJointCmds"))
    (:file "_package_PublishJointCmds" :depends-on ("_package"))
  ))