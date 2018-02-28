;;; python-conf.el --- Configuration of python
;;; Commentary:
;;; Added at 2018/2/26 -- 22:15

;;; Code:
(use-package elpy
  :ensure t
  :defer t
  :init
  ;; (elpy-enable)
  (add-hook 'python-mode-hook 'elpy-mode))

(provide 'python-conf)
;;; python-conf.el ends here
