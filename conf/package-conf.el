;;; package-conf.el --- Configuration of packages
;;; Commentary:
;;; Added at 2018/1/5

;;; Code:

(require 'package)

(setq package-archives '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")))

;; (eval-after-load "package" '(package-initialize))
(package-initialize)

(provide 'package-conf)
;;; package-conf.el ends here
