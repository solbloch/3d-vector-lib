(in-package :cl-user)
(defpackage :vector3d
  (:use :cl)
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
   #:cross
   #:lensqr
   #:len))

(defpackage :state
  (:use :cl :vector3d)
  (:export
   #:state
   #:nc-o-mass
   #:c-o-mass
   #:dist))

(defpackage :test
  (:use :cl :vector3d :state))
