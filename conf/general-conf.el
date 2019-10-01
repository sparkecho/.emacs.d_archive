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
(global-set-key (kbd "C-c s") 'counsel-ag)


;; ref: isearch-forward-symbol-at-point [M-s .]
(defun swiper-forward-symbol-at-point ()
  "Do incremental search forward for a symbol found near point.
Like ordinary incremental search except that the symbol found at point
is added to the search string initially as a regexp surrounded
by symbol boundary constructs \\_< and \\_>.
See the command `isearch-forward-symbol' for more information."
  (interactive)
  (let ((bounds (find-tag-default-bounds)))
    (cond
      (bounds (when (< (car bounds) (point))
	            (goto-char (car bounds)))
              (swiper (buffer-substring-no-properties (car bounds) (cdr bounds))))
      (t (error "[No symbol at point]")))))


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
         ("C-x C-f" . counsel-find-file)
         ("M-s ." . swiper-forward-symbol-at-point))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; (require 'cl-lib)
;; (defun string-suffix-p (str1 str2 &optional ignore-case)
;;   "STR1 STR2 IGNORE-CASE."
;;   (let ((begin2 (- (length str2) (length str1)))
;;         (end2 (length str2)))
;;     (when (< begin2 0) (setq begin2 0))
;;     (eq t (compare-strings str1 nil nil str1 begin2 end2 ignore-case))))
;; (defun my-file-match (str)
;;   "STR."
;;   (and (not (cl-remove-if-not (lambda (x) (string-suffix-p x str))
;;                               completion-ignored-extensions))
;;        (not (string-prefix-p "." str))))
;; (defadvice completion-file-name-table (after ignoring-backups-f-n-completion activate)
;;   (when (and (listp ad-return-value)
;;              (stringp (car ad-return-value))
;;              (cdr ad-return-value))
;;     (let ((newlis (cl-remove-if-not 'my-file-match ad-return-value)))
;;       (when (and (listp newlis) (cdr newlis))
;;         (setq ad-return-value newlis)))))

(provide 'general-conf)
;;; general-conf.el ends here
