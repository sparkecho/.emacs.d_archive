;;; gdb-conf.el --- Configuration of gdb
;;; Commentary:
;;; Debugging tool setting.
;;; Added at 2018/1/27 -- 19:00

;;; Code:

;; References:
;; [1] https://emacs.stackexchange.com/questions/7991/how-can-i-delete-all-the-gdb-related-windows-buffers-after-q-in-gdb-cli-window
;; [2] https://emacs.stackexchange.com/questions/26855/how-to-automatically-restore-the-previous-window-layout-after-gdb
;; [3] https://emacs.stackexchange.com/questions/14509/kill-process-buffer-without-confirmation

(add-hook 'gdb 'gdb-many-windows)


(defvar all-gud-modes
  '(gud-mode comint-mode gdb-locals-mode gdb-frames-mode  gdb-breakpoints-mode)
  "A list of modes when using gdb.")

(defun kill-all-gud-buffers ()
  "Kill all gud buffers including Debugger, Locals, Frames, Breakpoints.
Do this after `q` in Debugger buffer."
  (interactive)
  (save-excursion
    (let ((count 0))
      (dolist (buffer (buffer-list))
        (set-buffer buffer)
        (when (member major-mode all-gud-modes)
          (setq count (1+ count))
          (kill-buffer buffer)
          (delete-other-windows))) ;; fix the remaining two windows issue
      (message "Killed %i buffer(s)." count))))

(defun egdbe-quit ()
  "Quit gdb."
  (interactive)
  (gud-basic-call "quit")
  ;; Kill process buffers without confirmation.[3]
  (let ((kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions)))
    (kill-all-gud-buffers)))

(defun egdbe-gud-mode-hook ()
  "Use key `q` to quit gdb."
  (local-unset-key (kbd "q"))
  (local-set-key (kbd "q") 'egdbe-quit))

(add-hook 'gud-mode-hook 'egdbe-gud-mode-hook)

(provide 'gdb-conf)
;;; gdb-conf.el ends here
