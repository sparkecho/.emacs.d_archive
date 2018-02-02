;;; package-conf.el --- Configuration of packages
;;; Commentary:
;;; Added at 2018/1/5

;;; Code:

(eval-when-compile (require 'custom-conf))

;; DO NOT copy package-selected-packages to init/custom file forcibly.
;; https://github.com/seagle0128/.emacs.d/blob/master/lisp/init-package.el
(with-eval-after-load 'package
  (defun package--save-selected-packages (&optional value)
    "Set and (don't!) save `package-selected-packages' to VALUE."
    (when value
      (setq package-selected-packages value))
    (unless after-init-time
      (add-hook 'after-init-hook #'package--save-selected-packages))))

(setq package-archives '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")))

(setq package-enable-at-startup nil)
(package-initialize)

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(provide 'package-conf)
;;; package-conf.el ends here
