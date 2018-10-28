;;; nw.el --- initial configuration of emacs -nw
;;; Commentary:
;;; Code:

;; Load Path
(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugins" user-emacs-directory))

;; Packages
(package-initialize)
(require 'package-conf)


(setq inhibit-startup-message t)        ;关闭欢迎页面
(menu-bar-mode   0)                     ;关闭Emacs菜单栏
(global-linum-mode  t)                  ;全局显示行号
(column-number-mode t)                  ;显示列号
(show-paren-mode    t)                  ;显示括号匹配
(global-hl-line-mode 1)                 ;高亮当前行

;; Preferences
(require 'shortcut-keys-conf)
(require 'general-conf)
(require 'gdb-conf)
(require 'markdown-conf)
(require 'org-conf)
(require 'term-conf)

;; Programming
(require 'cc-conf)
(require 'python-conf)

;;; nw.el ends here
