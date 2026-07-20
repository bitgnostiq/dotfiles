;;; init.el --- main configuration entry point -*- lexical-binding: t -*-

;;; Package bootstrap

;; Add modules directory and subdirectories to load-path
(let ((default-directory (expand-file-name "modules" user-emacs-directory)))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "init-custom.el"))
(load custom-file 'noerror 'nomessage)

;; Requisites
(require 'init-package)
(require 'init-no-littering)

(elpaca-wait)

;;; UI
(setopt visible-bell nil                 ; disable visual bell
        ring-bell-function #'ignore      ; disable audible bell
        use-short-answers t)             ; y/n instead of yes/no


;;; Scrolling
(setopt scroll-step 1
        scroll-margin 0
        scroll-conservatively 100000
        scroll-preserve-screen-position t
        auto-window-vscroll nil
        hscroll-step 1
        hscroll-margin 2
        mouse-wheel-scroll-amount-horizontal 1
        mouse-wheel-progressive-speed nil
        fast-but-imprecise-scrolling nil
        jit-lock-defer-time 0)
(pixel-scroll-precision-mode 1)

;;; Persistence

;; Remember minibuffer history across sessions
(setq history-length 25)
(savehist-mode 1)

;; Recently opened files
(setopt recentf-max-saved-items 300
        recentf-max-menu-items 15)
(recentf-mode 1)

;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

;; Revert Dired and other non-file buffers automatically
(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)

;; Disable auto-save files
(setq auto-save-default nil)

;; Use system trash instead of permanent deletion
(setopt delete-by-moving-to-trash t)

;; Don't generate backups or lockfiles.
(setq create-lockfiles nil
      make-backup-files nil
      version-control t     ; number each backup file
      backup-by-copying t   ; instead of renaming current file (clobbers links)
      delete-old-versions t ; clean up after itself
      kept-old-versions 5
      kept-new-versions 5
      backup-directory-alist (list (cons "." (concat user-emacs-directory "backup/"))))

;;; Modeline

;; Show current line and column in modeline
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;;; Buffers

;; Show relative line numbers in all buffers
(setopt display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Tab behaviour
(setq tab-always-indent 'complete)
(setq-default indent-tabs-mode nil
              tab-width 2)

;; Auto-close matching pairs (parens, brackets, quotes)
(electric-pair-mode 1)

;; highlight the current line
(global-hl-line-mode +1)

;; Clear scratch buffer message
(setq initial-scratch-message nil)

;;; Module loading

;; Keybinding
(require 'init-meow)

;; Visual
(require 'init-theme)
(require 'init-dashboard)
(require 'init-modeline)                ;
(require 'init-todo)

;; Completion
(require 'init-completion)

;; LSP and languages
(require 'init-lsp)
(require 'init-apheleia)
(require 'init-go)
(require 'init-rust)
(require 'init-csharp)
(require 'init-lisp)

;; Utilities
(require 'init-which-key)
(require 'init-clipboard)
(require 'init-magit)
(require 'init-dired)
(require 'init-pinentry)

;; Org
(require 'init-org)
;;; init.el ends here
