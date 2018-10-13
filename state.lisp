(in-package :state3d)

(declaim (inline make-state state-pos state-vel state-acc state-mass))
(declaim (inline dist posi velo))

(defstruct state
  (pos (v3 0d0 0d0 0d0) :type v3)
  (vel (v3 0d0 0d0 0d0) :type v3)
  (acc (v3 0d0 0d0 0d0) :type v3)
  (mass 1d0 :type double-float))

(defmacro state (x y z vx vy vz m)
  `(make-state :pos (v3 ,x ,y ,z) :vel (v3 ,vx ,vy ,vz) :mass ,m))

(defun dist (a b)
  (declare (type state a b)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (len (sub (state-pos a) (state-pos b))))

(defun nc-o-mass (a b)
  (declare (type state a b)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (nmul (state-pos a) (state-mass a))
  (nadd (state-pos a) (mul (state-pos b) (state-mass b)))
  (setf (state-mass a) (+ (state-mass a) (state-mass b)))
  (ndiv (state-pos a) (state-mass a)))

(defun posi (a dt)
  (declare (type state a)
           (type double-float dt)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (nadd (state-pos a) (mul (state-vel a) dt)))

(defun velo (a dt)
  (declare (type state a)
           (type double-float dt)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (nmul (state-acc a) dt)
  (nadd (state-vel a) (state-acc a))
  (reset (state-acc a)))
