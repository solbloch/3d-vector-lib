(in-package :vector3d)

(declaim (inline v3x v3y v3z make-v3 sqrt expt))
(declaim (inline nadd add nsub sub nmul mul ndiv div dot cross lensqr len))

(defstruct (v3 (:conc-name v3))
  (x 0d0 :type double-float)
  (y 0d0 :type double-float)
  (z 0d0 :type double-float))

(defmacro v3 (x0 y0 z0)
  `(make-v3 :x ,x0 :y ,y0 :z ,z0))

(defun nadd (a b)
  (declare (type v3 a b)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (setf (v3x a) (+ (v3x a) (v3x b)))
  (setf (v3y a) (+ (v3y a) (v3y b)))
  (setf (v3z a) (+ (v3z a) (v3z b)))
  NIL)

(defun add (a b)
  (declare (type v3 a b)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (make-v3 :x (+ (v3x a) (v3x b))
           :y (+ (v3y a) (v3y b))
           :z (+ (v3z a) (v3z b))))

(defun nsub (a b)
  (declare (type v3 a b)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (setf (v3x a) (- (v3x a) (v3x b)))
  (setf (v3y a) (- (v3y a) (v3y b)))
  (setf (v3z a) (- (v3z a) (v3z b)))
  NIL)

(defun sub (a b)
  (declare (type v3 a b)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (make-v3 :x (- (v3x a) (v3x b))
           :y (- (v3y a) (v3y b))
           :z (- (v3z a) (v3z b))))

(defun nmul (a b)
  (declare (type double-float b)
           (type v3 a)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (setf (v3x a) (* (v3x a) b))
  (setf (v3y a) (* (v3y a) b))
  (setf (v3z a) (* (v3z a) b))
  NIL)

(defun mul (a b)
  (declare (type double-float b)
           (type v3 a)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (make-v3 :x (* (v3x a) b)
           :y (* (v3y a) b)
           :z (* (v3z a) b)))

(defun ndiv (a b)
  (declare (type double-float b)
           (type v3 a)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (nmul a (/ 1 b))
  NIL)

(defun div (a b)
  (declare (type double-float b)
           (type v3 a)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (mul a (/ 1 b)))

(defun dot (a b)
  (declare (type v3 a b)
           (optimize (speed 1) (safety 1) (compilation-speed 0)))
  (+ (* (v3x a) (v3x b))
     (* (v3y a) (v3y b))
     (* (v3z a) (v3z b))))

(defun cross (a b)
  (declare (type v3 a b)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (make-v3 :x (- (* (v3y a) (v3z b)) (* (v3y b) (v3z a)))
           :y (- (* (v3z a) (v3x b)) (* (v3z b) (v3x a)))
           :z (- (* (v3x a) (v3y b)) (* (v3x b) (v3y a)))))

(defun lensqr (a)
  (declare (type v3 a)
           (optimize (speed 1) (safety 1) (compilation-speed 0)))
  (+ (expt (v3x a) 2) (expt (v3y a) 2) (expt (v3z a) 2)))

(defun len (a)
  (declare (type v3 a)
           (optimize (speed 1) (safety 1) (compilation-speed 0)))
  (sqrt (lensqr a)))
