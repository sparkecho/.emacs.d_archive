;;; esup-conf.el --- Configuration of esup
;;; Commentary:
;;; Added at 2016/4/17 -- 13:07

;;; Code:


;; Esup 用于统计各个插件所占启动的时间
;; https://github.com/jschaf/esup
(add-to-list 'load-path "~/.emacs.d/plugins/esup")
;;(autoload 'esup "esup" "Emacs Start Up Profiler." nil)
(require 'esup)

(provide 'esup-conf)
;;; esup-conf.el ends here
