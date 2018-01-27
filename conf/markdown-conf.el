;;; markdown-conf.el --- Configuration of markdown
;;; Commentary:
;;; Added at 2018/1/27

;;; Code:

;; References:
;; https://jblevins.org/projects/markdown-mode/
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(eval-after-load 'markdown
  '(progn
     (setq markdown-live-preview-mode "*eww*")
     ;; `commonmarker': gem install commonmarker
     ;;                 https://github.com/github/markup#markups
     (setq markdown-command "commonmarker")))

(provide 'markdown-conf)
;;; markdown-conf.el ends here
