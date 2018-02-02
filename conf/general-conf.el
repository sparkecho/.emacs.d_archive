;;; general-conf.el --- Configuration of general
;;; Commentary:
;;; Added at 2018/1/11 -- 11:46

;;; Code:

;; Code folding
;; Reference: [https://stackoverflow.com/questions/12763566/how-to-permanently-enable-the-hs-minor-mode-in-emacs]
(add-hook 'prog-mode-hook  #'hs-minor-mode)
(global-set-key (kbd "M-i") 'hs-toggle-hiding)

;; Company 自动补全
(use-package company
  :ensure t
  :defer t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (add-hook 'c++mode-hook
            (lambda ()
              (use-package company-irony :ensure t :defer t)))
  (setq company-idle-delay             nil
        company-minimum-prefix-length  2
        company-show-numbers           t
        company-tooltip-limit          20)
  (add-to-list 'company-backends
               '((company-irony company-irony-c-headers))))


;; Flycheck 词法检查
;; Added at 2016/9/7 -- 21:52
(global-flycheck-mode)

;; Yasnippet
(yas-global-mode 1)

;; Saving Emacs Sessions
;; (desktop-save-mode 1)

;; Configured in 2015/9/10  --22:36
(setq-default indent-tabs-mode  nil)

;; 打开图片显示功能
(auto-image-file-mode t)

;; 用 y/n 代替 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable disabled commands
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; 补全时忽略大小写
(setq completion-ignore-case  t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; Extend shell-mode
(add-hook 'shell 'shx-mode)

(provide 'general-conf)
;;; general-conf.el ends here
