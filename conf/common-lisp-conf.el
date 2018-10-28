;;; common-lisp-conf.el --- Configuration of the Development Enviornment of Common Lisp
;;; Commentary:
;;; Configured in 2015/9/3  --14.08


;;; Code:

;; Single Lisp 单一 Lisp
;; Location of Common Lisp implementations
;; (setq inferior-lisp-program "/usr/local/bin/sbcl")       ;Location of SBCL

;; Multiple Lisp 多种 Lisp
;; Reference:
;; 这个变量包含了一个Lisp程序的列表, 如果你通过一个减号前缀参数启动SLIME, M-- M-x slime,
;; 你可以从这个列表里选择一个程序. 当不加前缀地启动该命令, slime-default-lisp
;; 变量里指定的程序或者是列表中的第一项会被使用. 列表的元素应该像这样:
;; (NAME (PROGRAM PROGRAM-ARGS...) &key CODING-SYSTEM INIT INIT-FUNCTION ENV)
(defvar slime-lisp-implementations
  '((sbcl  ("/usr/bin/sbcl")) ; :coding-system "utf-8-unix")) error
    (ccl   ("/usr/local/bin/ccl"))
    ;; (ccl32 ("/usr/local/ccl/lx86cl"))
    (ecl   ("/usr/bin/ecl"))))
;; (clisp ("/usr/bin/clisp"))))

;; (require 'slime)
;; (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'slime-lisp-mode-hook
          (lambda ()
            (with-current-buffer (get-buffer "*inferior-lisp*")
              (inferior-lisp-mode))))

;; 启动加载
(require 'slime-autoloads)
(slime-setup '(slime-fancy
               slime-media
               slime-indentation
               slime-sbcl-exts))

;; Set indentation style
;; https://emacs.stackexchange.com/questions/30788/why-does-emacs-indent-my-lisp-loop-construct-weirdly
(setq lisp-indent-function 'common-lisp-indent-function)
(common-lisp-set-style "sbcl")

(defvar slime-enable-evaluate-in-emacs t)	;needed to display images
;; test image types support (ielm mode run)
;; (mapcar #'(lambda (type)
;; 	    (list type (image-type-available-p type)))
;; 	image-types)

;; Image Setting
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq slime-enable-evaluate-in-emacs t)

(defun slime-enable-concurrent-hints ()
  "Make Emacs show hints when live coding."
  (interactive)
  (setf slime-inhibit-pipelining nil))
(slime-enable-concurrent-hints)

(eval-after-load 'slime
  '(progn
     (define-key slime-mode-map (kbd "C-c C-s") #'slime-selector)
     (define-key slime-mode-map (kbd "C-c C-]") #'slime-close-all-parens-in-sexp)
     (define-key slime-repl-mode-map (kbd "C-c C-s") #'slime-selector)
     (define-key slime-repl-mode-map (kbd "C-c C-]") #'slime-close-all-parens-in-sexp)))

;;; Auto Complete

(require 'company)
(add-hook 'lisp-mode-hook 'company-mode)
(add-hook 'slime-mode-hook 'company-mode)
(add-hook 'slime-repl-mode-hook 'company-mode)
(require 'slime-company)


;; (require 'ac-slime)
;; (add-hook 'slime-mode-hook 'set-up-slime-ac)
;; (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; (require 'ac-slime)
;; (add-hook 'lisp-mode-hook 'set-up-slime-ac)

;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'slime-repl-mode))

;; Doesn't work
;; (add-hook 'slime-mode-hook
;;           (lambda ()
;;             (make-local-variable 'ac-stop-words)
;;             (add-to-list 'ac-stop-words ")")))
;; (add-hook 'slime-repl-mode-hook
;;           (lambda ()
;;             (make-local-variable 'ac-stop-words)
;;             (add-to-list 'ac-stop-words ")")))
;; (add-hook 'lisp-mode-hook
;;           (lambda ()
;;             (make-local-variable 'ac-stop-words)
;;             (add-to-list 'ac-stop-words ")")))


;;(require 'common-lisp-snippets)		;snippets 补全插件
(require 'highlight-quoted)

;; Look Up the CLHS (Common Lisp HyperSpec)
(setq common-lisp-hyperspec-root "file:~/.emacs.d/plugins/HyperSpec/")



;; 加快 Swank 加载的速度
;; 缺点:
;;    1.配置略繁琐
;;    2.当升级 SLIME 或 SBCL 时, 需要创建一个新的 core file.
;;    3.当使用 quicklisp 安装包时, 可能会出错


;; shell $ sbcl
;;       * (mapc 'require '(sb-bsd-sockets sb-posix sb-introspect sb-cltl2 asdf))
;;       * (save-lisp-and-die "sbcl.core-for-slime")
;; .emacs 设置
;; (setq slime-lisp-implementations
;;    '((sbcl ("sbcl" "--core" "sbcl.core-for-slime"))))

;; 在核心文件里直接包含 Swank 服务器, 以最大化启动速度

;; shell $ sbcl
;;       * (load ".../slime/swank-loader.lisp")
;;       * (swank-loader:dump-image "sbcl.core-with-swank")

;; .emacs 设置
;; (setq slime-lisp-implementations
;;    '((sbcl ("sbcl" "--core" "sbcl.core-with-swank")
;;            :init (lambda (port-file _)
;;                    (format "(swank:start-server %S)\n" port-file)))))

(provide 'common-lisp-conf)
;;; common-lisp-conf.el ends here
