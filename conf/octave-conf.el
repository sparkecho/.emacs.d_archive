;;; octave-conf.el --- Configuration of octave
;;; Commentary:
;;; Added at 2016/4/3 -- 22:59

;;; Code:

(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; (require 'ac-octave)

;; (defun ac-octave-mode-setup ()
;;   (setq ac-sources '(ac-source-octave)))

;; (add-hook 'octave-mode-hook
;; 		  '(lambda () (ac-octave-mode-setup)))

(provide 'octave-conf)
;;; octave-conf.el ends here
