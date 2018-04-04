;;; general-conf.el --- Configuration of general
;;; Commentary:
;;; Added at 2018/1/11 -- 11:46

;;; Code:

;; Code folding
;; Reference: [https://stackoverflow.com/questions/12763566/how-to-permanently-enable-the-hs-minor-mode-in-emacs]
(add-hook 'prog-mode-hook  #'hs-minor-mode)
(global-set-key (kbd "M-i") 'hs-toggle-hiding)

;; ;; Company 自动补全
;; (use-package company
;;   :ensure t
;;   :defer t
;;   :init
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   :config
;;   (setq company-idle-delay             nil
;;         company-minimum-prefix-length  2
;;         company-show-numbers           t
;;         company-tooltip-limit          20))


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

;; Find symbol in all files of this dir
(global-set-key (kbd "C-c C-s") 'counsel-ag)

;; Use ivy and swiper to extend minibuffer
;; Reference: https://github.com/zamansky/using-emacs/blob/master/myinit.org
(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-r" . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(provide 'general-conf)
;;; general-conf.el ends here
