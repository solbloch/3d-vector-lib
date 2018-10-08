(in-package :cl-user)
(load (merge-pathnames "v3.fasl" *default-pathname-defaults*))

(use-package :vector3d)

(defvar foo (v3 0d0 0d0 0d0))

(defvar bar (v3 1d0 1d0 1d0))

(defvar foo-bar (add foo bar))
