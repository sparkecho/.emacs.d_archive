;;; appearence-conf.el --- Configuration of Emacs's appearence
;;; Commentary:
;;; Added at 2015/9/3  --14:01

;;; Code:

(setq inhibit-startup-message t)        ;关闭欢迎页面
(add-hook 'emacs-startup-hook
          (lambda ()
            (cd default-directory)
            (eshell)))

(tool-bar-mode   0)                     ;关闭Emacs工具栏
(scroll-bar-mode 0)                     ;隐藏滚动条
(menu-bar-mode   0)                     ;关闭Emacs菜单栏
(toggle-frame-maximized)                ;窗口最大化

(global-linum-mode t)                   ;全局显示行号
(column-number-mode t)                  ;显示列号

(mouse-avoidance-mode 'animate)         ;光标靠近鼠标指针时，让鼠标指针自动让开

;; (global-hl-line-mode 1)         ;高亮当前行
;; (require 'hl-spotlight)         ;高亮当前行及附近几行
;; (global-hl-spotlight-mode 1)

;; 窗口半透明 (2016/4/30 -- 14:29)
(defvar alpha-list '((100 100) (85 55)))
(defun loop-alpha ()
  "Switch between semitransparent and opaque."
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab))))
	 (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))))

;; Full screen
(defun fullscreen ()
  "Switch between fullscreen and not fullscreen, with key [F11]."
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0)))


;; Highlight active buffer (2018/1/21 -- 23:57)
(require 'highlight-focus)
;; set the background of the mode-line
(setq highlight-focus:face 'mode-line
      highlight-focus:face-property :background
      highlight-focus:face-property-value "wheat")


(provide 'appearence-conf)
;;; appearence-conf.el ends here
