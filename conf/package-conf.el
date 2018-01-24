;;; package-conf.el --- Configuration of packages
;;; Commentary:
;;; Added at 2018/1/5

;;; Code:

(require 'package)
;;(autoload 'package "package" "package" t)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "https://melpa.org/packages/")))
;; (add-to-list 'package-archives
;;  	     '("popkit" . "http://elpa.popkit.org/packages/")) ;国内的 Elpa 镜像站

(setq package-archives
      '(("popkit" . "http://elpa.popkit.org/packages/"))) ;国内的 Elpa 镜像站

;; (eval-after-load "package" '(package-initialize))
(package-initialize)

(provide 'package-conf)
;;; package-conf.el ends here
