;;; cc-conf.el --- C language setting
;;; Commentary:
;;; Configuration of Emacs's c-mode

;;; Code:


;; Appearence
(add-hook 'c-mode-hook 'linum-mode)
(add-hook 'c++-mode-hook 'linum-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 缩进调整

;; 缩进风格
(defvar c-default-style "ellemtel")
(setq-default c-basic-offset 4)
;; use space to indent by default
(setq-default indent-tabs-mode nil)
;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)
(local-set-key "\C-m" 'reindent-then-newline-and-indent)
(local-set-key "\C-cc" 'compile)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ECB customize
;;; Ref: http://ecb.sourceforge.net/docs/Programming-special-windows.html#Programming-special-windows
;;;      http://blog.yxwang.me/2010/02/bind-cscope-to-ecb/
;;;      http://ecb.sourceforge.net/docs/Standard-activation.html

;; (require 'ecb)
;; (eval-after-load 'ecb
;;   '(progn
;;      ;; Active cscope-minor-mode after ecb activate.
;;      (add-hook 'ecb-activate-hook 'cscope-minor-mode)

;;      (defvar ecb-cscope-buffer-name "*cscope*")

;;      (defecb-window-dedicator-to-ecb-buffer ecb-set-cscope-buffer ecb-cscope-buffer-name nil
;;        (switch-to-buffer ecb-cscope-buffer-name))

;;      (defun ecb-goto-window-cscope ()
;;        "Make the ECB-cscope window the current window."
;;        (interactive)
;;        (ecb-goto-ecb-window ecb-cscope-buffer-name))

;;      (define-key ecb-mode-map (kbd "C-c . g o") 'ecb-goto-window-cscope)

;;      (ecb-layout-define "my-cscope-layout" left nil
;;                         (ecb-set-sources-buffer)
;;                         (ecb-split-ver 0.25 t)
;;                         (other-window 1)
;;                         (ecb-set-methods-buffer)
;;                         (ecb-split-ver 0.33 t)
;;                         (other-window 1)
;;                         (ecb-set-history-buffer)
;;                         (ecb-split-ver 0.5 t)
;;                         (other-window 1)
;;                         (ecb-set-cscope-buffer))
;;      (setq ecb-layout-name "my-cscope-layout")
;;      (setq ecb-windows-width 0.22)
;;      ;; Disable buckets so that history buffer can display more entries.
;;      (setq ecb-history-make-buckets 'never)
;;      ;; When ecb is deactivate kill cscope buffer.
;;      (add-hook 'ecb-deactivate-hook (lambda () (kill-buffer ecb-cscope-buffer-name)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Grammar Check

;; Use Flycheck
(flycheck-mode t)

;; Donot use clang as checker
;; (setq-default flycheck-disabled-checkers '(c/c++-clang))

;; Set C++ standard version
;; Directory variable can do the same thing as well.
;; https://stackoverflow.com/questions/30949847/configuring-flycheck-to-work-with-c11
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
(setq flycheck-clang-include-path '("/opt/cuda/include"
                                    "/usr/include/qt"
                                    "/usr/include/qt/QtCore"
                                    "/usr/include/qt/QtGui"
                                    "/usr/include/qt/QtWidgets"))
;; (setq flycheck-check-syntax-automatically '(mode-enabled save))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Completion

;; (require 'semantic)
;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)
;; (semantic-mode 1)
;; (semantic-add-system-include "/usr/include/GL" 'c++-mode)
;; (semantic-add-system-include "/usr/include/GLFW" 'c++-mode)

;; ;; (global-set-key "\t" 'company-complete-common)
;; ;; (define-key company-mode-map "\t" nil)
;; ;; (define-key company-mode-map [(backtab)] 'company-complete-common)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Auto Completion
;;; Ref: https://www.youtube.com/watch?v=XeWZfruRu6k
;;;      http://cachestocaches.com/2015/8/c-completion-emacs/

(use-package company
  :ensure t
  :defer t
  :init
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode)
  :config
  ;; (setq company-backends (delete 'company-clang company-backends))
  ;; (setq company-backends (delete 'company-semantic company-backends))
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (setq company-idle-delay            0
        company-minimum-prefix-length 2
        company-show-numbers          t
        company-tooltip-limit         20))

(use-package company-irony
  :ensure t
  :defer t
  :config
  (require 'company)
  (add-to-list 'company-backends 'company-irony))

(use-package irony
  :ensure t
  :defer t
  :init
  (add-hook 'c++-mode-hook  'irony-mode)
  (add-hook 'c-mode-hook    'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  :config
  (add-to-list 'irony-supported-major-modes 'glsl-mode)
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(add-hook 'irony-mode-hook 'irony-eldoc)

;; (add-hook 'glsl-mode-hook '(lambda () (setq irony-mode nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Code Refactor

;; (require 'srefactor)
;; (require 'srefactor-lisp)
;; (define-key c-mode-map   (kbd "C-c RET") 'srefactor-refactor-at-point)
;; (define-key c++-mode-map (kbd "C-c RET") 'srefactor-refactor-at-point)

;; (defun run-clang-format ()
;;   "Run clang-format on c,cpp,h,hpp files in current dir and reverts buffer."
;;   (interactive)
;;   (and
;;    (string-match "*\\.\\(h\\|hpp\\|c\\|cpp\\)$" buffer-file-name)
;;    (save-some-buffers 'no-confirm)
;;    (shell-command (concat "clang-format -style=file -i " buffer-file-name))
;;    (message (concat "Saved and ran clang-format on " buffer-file-name))
;;    (revert-buffer t t t)))

;; (local-set-key "\M-q" 'run-clang-format)

;; clang-format
(defun clang-format-region (pmin pmax)
  "Run clang-format command in selected region(`PMIN', `PMAX')."
  (interactive "r")
  (shell-command-on-region pmin pmax
                           "clang-format -style=file"
                           (current-buffer)
                           t
                           (get-buffer-create "*clang-format error messages*")
                           t))

(defun clang-format ()
  "Run clang-format in the whole buffer."
  (clang-format-region (point-min) (point-max)))

(add-hook 'c-mode-hook (lambda () (local-set-key (kbd "M-q") 'clang-format-region)))
(add-hook 'c++-mode-hook (lambda () (local-set-key (kbd "M-q") 'clang-format-region)))

(provide 'cc-conf)
;;; cc-conf.el ends here
