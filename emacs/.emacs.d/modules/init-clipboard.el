;;; init-clipboard.el --- clipboard configuration -*- lexical-binding: t -*-

;; https://www.rahuljuliato.com/posts/emacs-clipboard-terminal
(use-package emacs-solo-clipboard
  :elpaca nil
  :no-require t
  :defer t
  :init
  (cond
   ;; macOS: use pbcopy/pbpaste
   ((eq system-type 'darwin)
    (setq interprogram-cut-function
          (lambda (text &optional _)
            (let ((process-connection-type nil))
              (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
                (process-send-string proc text)
                (process-send-eof proc)))))
    (setq interprogram-paste-function
          (lambda ()
            (shell-command-to-string "pbpaste"))))

   ;; WSL (Windows Subsystem for Linux): use clip.exe for copy and powershell.exe for paste
   ((and (eq system-type 'gnu/linux)
         (getenv "WSLENV"))
    (setq interprogram-cut-function
          (lambda (text &optional _)
            (let ((process-connection-type nil))
              (let ((proc (start-process "clip.exe" "*Messages*" "clip.exe")))
                (process-send-string proc text)
                (process-send-eof proc)))))
    (setq interprogram-paste-function
          (lambda ()
            (string-trim (shell-command-to-string "powershell.exe -command Get-Clipboard")))))

   ;; Linux with wl-copy/wl-paste (Wayland)
   ((and (eq system-type 'gnu/linux) (executable-find "wl-copy"))
    (setq interprogram-cut-function
          (lambda (text &optional _)
            (let ((process-connection-type nil))
              (let ((proc (start-process "wl-copy" "*Messages*" "wl-copy")))
                (process-send-string proc text)
                (process-send-eof proc)))))
    (setq interprogram-paste-function
          (lambda ()
            (shell-command-to-string "wl-paste -n"))))

   ;; Linux with xclip (X11)
   ((and (eq system-type 'gnu/linux) (executable-find "xclip"))
    (setq interprogram-cut-function
          (lambda (text &optional _)
            (let ((process-connection-type nil))
              (let ((proc (start-process "xclip" "*Messages*" "xclip" "-selection" "clipboard")))
                (process-send-string proc text)
                (process-send-eof proc)))))
    (setq interprogram-paste-function
          (lambda ()
            (shell-command-to-string "xclip -selection clipboard -o"))))))

(provide 'init-clipboard)
;;; init-clipboard.el ends here
