;;; org-conf.el --- Configuration of org
;;; Commentary:
;;; Added at

;;; Code:
(eval-after-load 'org
  '(progn
     (define-key org-mode-map (kbd "C-c C-c") 'org-preview-html-mode)
     (setq-default fill-column 80)
     (auto-fill-mode)
     ))

(provide 'org-conf)
;;; org-conf.el ends here
