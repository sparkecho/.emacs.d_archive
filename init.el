;;; init.el --- initial configuration of emacs
;;; Commentary:
;;; Code:

;; Load Path
(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugins" user-emacs-directory))

;; Customization
(require 'custom-conf)

;; Packages
(package-initialize)
(require 'package-conf)

;; Preferences
(require 'appearence-conf)
(require 'shortcut-keys-conf)
(require 'general-conf)
(require 'ecb-conf)
(require 'gdb-conf)
(require 'markdown-conf)
(require 'org-conf)

;; Programming
(require 'common-lisp-conf)
(require 'cc-conf)
(require 'asm-conf)
(require 'python-conf)
;; (require 'smalltalk-conf)
;; (require 'scala-conf)
;; (require 'javascript-conf)
;; (require 'octave-conf)
(require 'auctex-conf)

;; Others
;; (require 'auto-complete-conf)
;; (require 'esup-conf)

;; Configuration of helm
;; Added at 2016/4/17 -- 10:36
;; 启动时间太长，故禁止其自启动
;; 一些设置直接写入了 helm-mode.el 中
;; M-x helm-mode 启动 helm-mode 即可加载
;; (require 'helm-conf)


;;; init.el ends here
