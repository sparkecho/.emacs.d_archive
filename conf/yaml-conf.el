;;; yaml-conf.el --- Configuration of yaml
;;; Commentary:
;;; Added at 2016/11/21 -- 15:36

;;; Code:
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(provide 'yaml-conf)
;;; yaml-conf.el ends here
