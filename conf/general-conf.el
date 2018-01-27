;;; general-conf.el --- Configuration of general
;;; Commentary:
;;; Added at 2018/1/11 -- 11:46

;;; Code:

;; Code folding
;; Reference: [https://stackoverflow.com/questions/12763566/how-to-permanently-enable-the-hs-minor-mode-in-emacs]
(add-hook 'prog-mode-hook  #'hs-minor-mode)
(global-set-key (kbd "M-i") 'hs-toggle-hiding)

;; Flycheck 词法检查
;; Added at 2016/9/7 -- 21:52
(global-flycheck-mode)

;; Yasnippet
(yas-global-mode 1)

;; Saving Emacs Sessions
(desktop-save-mode 1)
(desktop-read)

;; Configured in 2015/9/10  --22:36
(setq-default indent-tabs-mode  nil)

;; 打开图片显示功能
(auto-image-file-mode t)

;; 用 y/n 代替 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable disabled commands
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


(provide 'general-conf)
;;; general-conf.el ends here
