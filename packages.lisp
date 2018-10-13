(in-package :cl-user)
(defpackage :vector3d
  (:use :cl)
  (:export
   #:make-v3
   #:v3
   #:v3x
   #:v3y
   #:v3z
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
   #:len
   #:reset))

(defpackage :state3d
  (:use :cl :vector3d)
  (:export
   #:make-state
   #:state
   #:dist
   #:nc-o-mass
   #:state-pos
   #:state-vel
   #:state-acc
   #:state-mass))

(defpackage :test
  (:use :cl :vector3d :state3d))
