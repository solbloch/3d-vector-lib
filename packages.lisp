(in-package :cl-user)
(defpackage :vector3d
  (:use :cl)
  (:export
   #:make-v3
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
   #:cross
   #:lensqr
   #:len))

(defpackage :state3d
  (:use :cl :vector3d)
  (:export
   #:make-state
   #:state
   #:dist))

(defpackage :test
  (:use :cl :vector3d :state3d))
