;;; custom-conf.el --- Configuration of custom
;;; Commentary:
;;; Added at 2017/2/1 -- 17:52

;;; Code:
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file))

(provide 'custom-conf)
;;; custom-conf.el ends here
