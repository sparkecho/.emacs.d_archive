;;; ecb-conf.el --- Configuration of ecb
;;; Commentary:
;;; Added at 2018/1/10

;;; Code:
;; (require 'cedet)
;; (global-ede-mode 1)                 ;Enable the Project management system
;; (global-srecode-minor-mode 1)       ; Enable template insertion menu

;; (require 'ecb)
(eval-after-load 'ecb
  '(progn
     ;; 不再弹出 ecb-tip-of-the-day 的弹框
     (setq ecb-tip-of-the-day nil)

     ;; Fix ECB mini buffer completion issue
     ;; https://github.com/ecb-home/ecb/issues/10 (toto-42)
     (defun display-buffer-at-bottom--display-buffer-at-bottom-around (orig-fun &rest args)
       "Bugfix for ECB: cannot use display-buffer-at-bottom', calldisplay-buffer-use-some-window' instead in ECB frame."
       (if (and ecb-minor-mode (equal (selected-frame) ecb-frame))
           (apply 'display-buffer-use-some-window args)
         (apply orig-fun args)))

     (advice-add 'display-buffer-at-bottom :around #'display-buffer-at-bottom--display-buffer-at-bottom-around)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ECB customize
;;; Ref: http://ecb.sourceforge.net/docs/Programming-special-windows.html#Programming-special-windows
;;;      http://blog.yxwang.me/2010/02/bind-cscope-to-ecb/
;;;      http://ecb.sourceforge.net/docs/Standard-activation.html
(eval-after-load 'ecb
  '(progn
     ;; Active cscope-minor-mode after ecb activate.
     (add-hook 'ecb-activate-hook 'cscope-minor-mode)

     (defvar ecb-cscope-buffer-name "*cscope*")

     (defecb-window-dedicator-to-ecb-buffer ecb-set-cscope-buffer ecb-cscope-buffer-name nil
       (switch-to-buffer ecb-cscope-buffer-name))

     (defun ecb-goto-window-cscope ()
       "Make the ECB-cscope window the current window."
       (interactive)
       (ecb-goto-ecb-window ecb-cscope-buffer-name))

     (define-key ecb-mode-map (kbd "C-c . g o") 'ecb-goto-window-cscope)

     (ecb-layout-define "my-cscope-layout" left nil
                        (ecb-set-sources-buffer)
                        (ecb-split-ver 0.25 t)
                        (other-window 1)
                        (ecb-set-methods-buffer)
                        (ecb-split-ver 0.33 t)
                        (other-window 1)
                        (ecb-set-history-buffer)
                        (ecb-split-ver 0.5 t)
                        (other-window 1)
                        (ecb-set-cscope-buffer))
     (setq ecb-layout-name "my-cscope-layout")
     (setq ecb-windows-width 0.22)
     ;; Disable buckets so that history buffer can display more entries.
     (setq ecb-history-make-buckets 'never)
     ;; When ecb is deactivate kill cscope buffer.
     (add-hook 'ecb-deactivate-hook (lambda () (kill-buffer ecb-cscope-buffer-name)))))


(provide 'ecb-conf)
;;; ecb-conf.el ends here
