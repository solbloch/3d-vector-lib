(in-package :test)

(defvar foo (v3 0d0 0d0 0d0))

(defvar bar (v3 1d0 1d0 1d0))

(defvar fb (v3 1d0 2d0 3d0))

(defvar dt 0.01d0)

(defvar sun (state 0d0 0d0 0d0 0d0 0d0 0d0 1d0))

(defvar earth (state 1d0 0d0 0d0 0d0 (* 2 pi) 0d0 3.003d-6))

(defvar bodies (list sun earth))

(defun accel (a b G)
  (declare (type state a b)
           (type double-float G)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (let* ((r (sub (state-pos a) (state-pos b)))
         (rlen (len r)))
    (declare (type double-float rlen)
             (type v3 r))
    (nmul r (* G (state-mass b) (/ 1 (expt rlen 3))))
    (nadd (state-acc a) r)))

(defun accel-loop-brute ()
  (declare (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (dolist (b bodies)
    (declare (type state b))
    (dolist (j bodies)
      (declare (type state j))
      (if (not (equal b j)) (accel b j (- (* 4 (expt pi 2))))))))

(defun posi-loop (dt)
  (declare (type double-float dt)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (dolist (b bodies)
    (declare (type state b))
    (posi b dt)))

(defun velo-loop (dt)
  (declare (type double-float dt)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (dolist (b bodies)
    (declare (type state b))
    (velo b dt)))

(defun cycle (dt)
  (declare (type double-float dt)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (let ((dt-h (/ dt 2)))
    (declare (type double-float dt-h))
    (posi-loop dt-h)
    (accel-loop-brute)
    (velo-loop dt)
    (posi-loop dt-h)))

(format t "F~%F~%")
(do* ((ti 0d0 (+ ti dt)))
     ((> ti 1000))
  (declare (type double-float ti dt)
           (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (cycle dt)
  (dolist (b bodies)
    (declare (type state b))
    (format t "c3 ~f ~f ~f 0.1~%"
            (v3x (state-pos b))
            (v3y (state-pos b))
            (v3z (state-pos b))))
  (format t "F~%"))

