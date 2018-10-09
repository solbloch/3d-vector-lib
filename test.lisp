(in-package :test)
(defvar a 0d0)
(defvar foo (v3 0d0 0d0 0d0))

(defvar bar (v3 1d0 1d0 1d0))

(defvar fb (v3 1d0 2d0 3d0))

(defun test ()
  (declare (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (let ((x 0))
    (declare (type fixnum x))
    (loop for i from 1 to 100000000 do (setf x i))
    x))
