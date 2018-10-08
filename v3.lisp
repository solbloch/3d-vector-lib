(in-package :vector3d)


(defstruct (v3 (:conc-name v3))
  (x 0d0 :type double-float)
  (y 0d0 :type double-float)
  (z 0d0 :type double-float))

(defmacro v3 (x0 y0 z0)
  `(make-v3 :x ,x0 :y ,y0 :z ,z0))

(declaim (inline v3x v3y v3z make-v3))
(declaim (inline nadd add nsub sub nmul mul ndiv div))

(defun nadd (a b)
  (declare (type v3 a b)
           (optimize (speed 1) (safety 1) (compilation-speed 0)))
  (setf (v3x a) (+ (v3x a) (v3x b)))
  (setf (v3y a) (+ (v3y a) (v3y b)))
  (setf (v3z a) (+ (v3z a) (v3z b))))

(defun add (a b)
  (declare (type v3 a b)
           (optimize (speed 1) (safety 1) (compilation-speed 0)))
  (make-v3 :x (+ (v3x a) (v3x b))
           :y (+ (v3y a) (v3y b))
           :z (+ (v3z a) (v3z b))))

(defun nsub (a b)
  (declare (type v3 a b)
           (optimize (speed 1) (safety 1) (compilation-speed 0)))
  (setf (v3x a) (- (v3x a) (v3x b)))
  (setf (v3y a) (- (v3y a) (v3y b)))
  (setf (v3z a) (- (v3z a) (v3z b))))

(defun sub (a b)
  (declare (type v3 a b)
           (optimize (speed 1) (safety 1) (compilation-speed 0)))
  (make-v3 :x (- (v3x a) (v3x b))
           :y (- (v3y a) (v3y b))
           :z (- (v3z a) (v3z b))))

(defun nmul (a b)
  (declare (type double-float b)
           (type v3 a)
           (optimize (speed 1) (safety 1) (compilation-speed 0)))
  (setf (v3x a) (* (v3x a) b))
  (setf (v3y a) (* (v3y a) b))
  (setf (v3z a) (* (v3z a) b)))
