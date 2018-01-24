;;; package --- configuration of Assumble Language
;;; Commentary:
(require 'asm-mode)

;;; Code:
(setq tab-width 8)                      ;设置 tab 为 8 个空格的宽度
(setq asm-mode-hook
      ;; 使用符号 # 作为注释的标志, 而不是默认的 ;
      (lambda () (progn ;;(setq comment-start "# ")
                        (setq comment-add 0))))

(provide 'asm-conf)
;;; asm-conf.el ends here
