;;; init-theme.el --- theme settings -*- lexical-binding: t -*-

(use-package doom-themes
  :elpaca t)

(use-package compline-theme
  :elpaca (:host github
                 :repo "joshuablais/compline"
                 :files ("doom emacs/compline-theme.el"))
  :after doom-themes
  :config
  (add-to-list 'custom-theme-load-path
               (expand-file-name "data/elpaca/builds/compline-theme" user-emacs-directory))
  (load-theme 'compline t))

(provide 'init-theme)
;;; init-theme.el ends here
