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

(provide 'ecb-conf)
;;; ecb-conf.el ends here
