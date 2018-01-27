;;; init.el --- initial configuration of emacs
;;; Commentary:
;;; Code:

;; Configuration of Load Path
;; Added at 2016/4/16 -- 23:30
(add-to-list 'load-path "~/.emacs.d/conf")
(add-to-list 'load-path "~/.emacs.d/plugins")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ecb-options-version "2.50")
 '(ecb-source-path (quote (("/" "/"))))
 '(package-selected-packages
   (quote
    (moe-theme spacemacs-theme slime company esup cnfonts org-preview-html xcscope srefactor smex slime-company password-mode matlab-mode markdown-mode magit irony-eldoc highlight-quoted helm glsl-mode ghci-completion geiser flycheck-irony flycheck-clangcheck ess elisp-slime-nav ecb company-irony-c-headers company-irony company-c-headers company-auctex common-lisp-snippets cmake-mode auto-complete-nxml auto-complete-clang auto-complete-c-headers auto-complete-auctex 2048-game)))
 '(tool-bar-mode nil))


;; ;; Configuration of Load Path
;; ;; Added at 2016/4/16 -- 23:30
;; (add-to-list 'load-path "~/.emacs.d/conf")
;; (add-to-list 'load-path "~/.emacs.d/plugins")


;; Configuration of Package (mainly Elpa/Melpa)
;; Added at 2016/4/17 -- 12:53
(require 'package-conf)


;; Configuration of Emacs's appearence
;; Added at 2016/4/17 -- 12:29
(require 'appearence-conf)


;; Configuration of Emacs's Short Cut keys
;; Added at 2016/4/17 -- 12:35
(require 'shortcut-keys-conf)


;; Configuration of Programming General Setting
;; Added at 2018/1/11 -- 11:48
(require 'general-conf)


;; Configuration of ecb 代码浏览设置
;; Added at 2016/5/23 -- 19:22
(require 'ecb-conf)


;; Configuration of gdb Debug tool
;; Added at 2018/1/27 -- 19:49
(require 'gdb-conf)


(require 'markdown-conf)
(require 'org-conf)


;; Configuration of the Development Enviornment of Common Lisp
;; Added at 2016/4/17 -- 11:00
(require 'common-lisp-conf)


;; Configuration of C/C++ language
;; Added at 2016/4/17 -- 11:03
(require 'cc-conf)


;; Configuration of Asm
;; Added at 2016/7/6 -- 9:13
(require 'asm-conf)


;; Configuration of the Development Enviornment of (GNU) Smalltalk
;; Added at 2016/4/17 -- 12:20
;; (require 'smalltalk-conf)


;; Configuration of the Development Environment of Scala
;; Added at 2016/4/17 -- 20:02
;; (require 'scala-conf)


;; Configuration of the Development Environment of JavaScript
;; Added at 2016/4/17 -- 12:38
;; (require 'javascript-conf)


;; Configuration of the Development Environment of Octave
;; Added at 2016/4/17 -- 12:40
;; (require 'octave-conf)


;; Configuration of the Environment of TeX/LaTeX
(require 'auctex-conf)


;; Configuration of auto-complete
;; Added at 2016/4/16 -- 16:45
;; Deleted at 2018/1/11 -- 1:55
;; (require 'auto-complete-conf)


;; Configuration of esup
;; Added at 2016/4/17 -- 13:08
;; (require 'esup-conf)


;; Configuration of helm
;; Added at 2016/4/17 -- 10:36
;; 启动时间太长，故禁止其自启动
;; 一些设置直接写入了 helm-mode.el 中
;; M-x helm-mode 启动 helm-mode 即可加载
;; (require 'helm-conf)


;;; init.el ends here
