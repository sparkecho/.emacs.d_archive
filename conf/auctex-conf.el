;;; package --- setting of editing latex
;;; Commentary:
;; C-c C-c TeX-command-master ;; 编译,当前环境下是 XeLaTeX
;; C-c C-e LaTeX-environment  ;; 插入环境,默认 section
;; C-c C-f TeX-font           ;; 字体设置快捷键前缀,
;; C-c C-j LaTeX-insert-item  ;; 插入 item,
;; C-c C-k TeX-kill-job       ;; 取消编译
;; C-c C-v TeX-view           ;; 打开 pdf viewer
;; C-c ; TeX-comment-or-uncomment-region  ;; 注释
;; C-c C-o C-b                ;; 代码折叠
;; C-c =                      ;; 查看当前文档的章节目录列表


;;; Code:
(add-to-list 'load-path "/usr/share/emacs/site-lisp")

(load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(if (string-equal system-type "windows-nt")
    (require 'tex-mik))

(mapc (lambda (mode)
        (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode
            'turn-on-auto-fill
            ))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            ;;LaTeX 模式下,不打开自动折行
            (turn-off-auto-fill)
            ;; 显示行数
            (linum-mode 1)
            ;; 打开自动补全
            (auto-complete-mode 1)
            ;; 启动 math mode
            (LaTeX-math-mode 1)
            ;; 打开 outline mode
            (outline-minor-mode 1)
            ;; 编译的时候,不在当前窗口中显示编译信息
            (setq TeX-show-compilation nil)
            (setq TeX-clean-confirm nil)
            (setq TeX-save-query nil)
            ;; 重新定义 pdf viewer, 设定为 evince
            (setq TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o")))
            (setq TeX-view-program-selection '((output-pdf "Evince")))
            ;; 设置编译引擎为 XeTeX
            (setq TeX-global-PDF-mode t)
            (setq TeX-engine 'xetex)
            ;; 使用 XeLaTeX 作为默认程序来编译 LaTeX
            (add-to-list 'TeX-command-list
                         '("XeLaTeX" "%'xelatex%(mode)%' %t"
                           TeX-run-TeX nil t))
            (setq TeX-command-default "XeLaTeX")
            ;; ;; force C-c C-c mean compile, without other choice
            ;; (setq TeX-command-force "XeLaTeX")


            (setq TeX-auto-untabify t) ; remove all tabs before saving
            (TeX-fold-mode 1)          ;代码折叠 C-c C-o C-b
            (imenu-add-menubar-index)     ;自动开启 index (目录) 菜单
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))

;; (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;; (setq TeX-source-correlate-start-server t)

;; 代码折叠的拓展
(setq TeX-fold-env-spec-list
      (quote (("[figure]" ("figure"))
              ("[table]"  ("table"))
              ("[itemize]"("itemize"))
              ("[overpic]"("overpic")))))



;; Setting of reftex
(setq reftex-plug-into-AUCTeX t)
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(autoload 'reftex-mode "reftex"
  "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex"
  "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite"
  "Make citation" nil)
(autoload 'reftex-index-phrase-mode
  "reftex-index" "Phrase mode" t)
;;*toc*buffer 在左侧
(setq reftex-toc-split-windows-horizontally t)
;;*toc*buffer 使用整个 frame 的比例
(setq reftex-toc-split-windows-fraction 0.2)


;;; Other setting

(global-set-key (kbd "C-c j") 'auto-fill-mode)
;; 回车时自动缩进
(setq TeX-newline-function 'newline-and-indent)


(provide 'auctex-conf)
;;; auctex-conf.el ends here
