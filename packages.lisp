(in-package :cl-user)
(defpackage :vector3d
  (:use cl)
  (:export
   #:v3
   #:nadd
   #:add
   #:nsub
   #:sub
   #:nmul
   #:mul
   #:ndiv
   #:div
   #:dot
   #:cross))

(defpackage :test
  (:use :cl :vector3d))
