;;; smalltalk-conf --- Configuration of the Development Enviornment of (GNU) Smalltalk
;;; Commentary:
;; Added at 2016/1/31 -- 20:12
;;; Code:

(require 'gst-mode)
(require 'smalltalk-mode)
(add-to-list 'auto-mode-alist '("\\.st\\'" . gst-mode))
(add-to-list 'auto-mode-alist '("\\.st\\'" . smalltalk-mode))

(provide 'smalltalk-conf)
;;; smalltalk-conf ends here
