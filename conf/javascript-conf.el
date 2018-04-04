;;; javascript-conf.el --- Configuration of Javascript
;;; Commentary:
;;; Added at 2016/4/16 -- 23:00

;;; Code:

;;; Reference:
;;; https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
;;; https://github.com/zamansky/using-emacs/blob/master/myinit.org#javascript

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)) ;use js2-mode as major mode
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)       ;Better imenu
;; (add-hook 'js-mode-hook 'js2-minor-mode)                ;use js2-mode as minor mode

;; ;; ag[https://github.com/ggreer/the_silver_searcher]: dependents by xref-js2
;; (add-hook 'js2-mode-hook #'js2-refactor-mode)
;; (js2r-add-keybindings-with-prefix "C-c C-r")
;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; ;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)

;; (add-hook 'js2-mode-hook (lambda ()
;;   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))


;; You may also want to hook it in for shell scripts running via node.js:
;; (add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; Support for JSX is available via the derived mode `js2-jsx-mode'.
;; If you also want JSX support, use that mode instead:
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

;; To customize how it works:
;; M-x customize-group RET js2-mode RET
;; (add-hook 'js2-mode-hook 'ac-js2-mode)

(provide 'javascript-conf)
;;; javascript-conf.el ends here
