;;; early-init.el --- early initialization -*- lexical-binding: t -*-

;; GC tuning
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 100 1000 1000)
                  gc-cons-percentage 0.1)
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(setq read-process-output-max (* 1024 1024))

;;; Package management

;; Disable package.el auto-initialization, we handle this in init.el
(setq package-enable-at-startup nil)

;;; GUI
(menu-bar-mode -1)
(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;;; Encoding settings
(prefer-coding-system 'utf-8)
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)


;;; Fonts

;; Use a preferred monospace font if available
(defun font-exists-p (font)
  (not (null (x-list-fonts font))))
(when (display-graphic-p)
  (cond
   ((font-exists-p "Monoid")
    (set-frame-font "Monoid:size=18" nil t))
   ((font-exists-p "JetBrains Mono")
    (set-frame-font "JetBrains Mono:size=18" nil t))))




;;; early-init.el ends here
