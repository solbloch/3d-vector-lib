(in-package :test)
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

(defvar foo (v3 0d0 0d0 0d0))

(defvar bar (v3 1d0 1d0 1d0))

(defvar fb (v3 1d0 2d0 3d0))

(defun test ()
  (declare (optimize (speed 3) (safety 1) (compilation-speed 0)))
  (loop for i from 1 to 1000000000 do (nmul bar 0.99d0)))

(defvar sun (state 0d0 0d0 0d0 0d0 0d0 0d0 1d0))

(defvar earth (state 1d0 0d0 0d0 0d0 (* 2 pi) 0d0 3.003d-6))

(defvar bodies (list sun earth))

(defvar dt 0.01d0)
;; (do* ((t 0d0 (+ t dt)))
;;      (> t 1000)
;;   (declare (type double-float t dt)
;;            (optimize (speed 3) (safety 1) (compilation-speed 0)))
;;   ())
