;;; init-no-littering.el --- keep ~/.emacs.d clean -*- lexical-binding: t -*-

(use-package no-littering
  :elpaca t
  :demand t
  :init
  (setq no-littering-var-directory (expand-file-name "config/" user-emacs-directory))
  (setq no-littering-etc-directory (expand-file-name "data/" user-emacs-directory))
  :config
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(provide 'init-no-littering)
;;; init-no-littering.el ends here
