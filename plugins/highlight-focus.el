;;; highlight-focus.el --- highlight the active buffer
;;; Author: Amit J Patel <amitp@cs.stanford.edu>
;;; Commentary:
;;; http://amitp.blogspot.com/2013/05/emacs-highlight-active-buffer.html
;;; Also see <https://github.com/emacsmirror/auto-dim-other-buffers>

;;; Code:

(require 'face-remap)
(defvar highlight-focus:last-buffer nil)
(defvar highlight-focus:cookie nil)
(defvar highlight-focus:app-has-focus t)
(defvar highlight-focus:face 'default)
(defvar highlight-focus:face-property :background)
(defvar highlight-focus:face-property-value "white")

(defun highlight-focus:check ()
  "Check if focus has changed, and if so, update remapping."
  (let ((current-buffer (and highlight-focus:app-has-focus (current-buffer))))
    (unless (eq highlight-focus:last-buffer current-buffer)
      (when (and highlight-focus:last-buffer highlight-focus:cookie)
        (with-current-buffer highlight-focus:last-buffer
          (face-remap-remove-relative highlight-focus:cookie)))
      (setq highlight-focus:last-buffer current-buffer)
      (when current-buffer
        (setq highlight-focus:cookie
              (face-remap-add-relative highlight-focus:face
                                       highlight-focus:face-property
                                       highlight-focus:face-property-value))))))

(defun highlight-focus:app-focus (state)
  (setq highlight-focus:app-has-focus state)
  (highlight-focus:check))

(defadvice other-window (after highlight-focus activate)
  (highlight-focus:check))
(defadvice select-window (after highlight-focus activate)
  (highlight-focus:check))
(defadvice select-frame (after highlight-focus activate)
  (highlight-focus:check))
(add-hook 'window-configuration-change-hook 'highlight-focus:check)

(add-hook 'focus-in-hook (lambda () (highlight-focus:app-focus t)))
(add-hook 'focus-out-hook (lambda () (highlight-focus:app-focus nil)))

(provide 'highlight-focus)
;;; highlight-focus.el ends here
