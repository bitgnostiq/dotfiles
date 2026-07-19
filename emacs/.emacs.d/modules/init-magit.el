;;; init-magit.el --- git porcelain -*- lexical-binding: t -*-

(use-package transient
  :elpaca (:host github :repo "magit/transient")
  :demand t)

(elpaca-wait)

(use-package magit
  :elpaca t
  :defer t
  :config
  (add-hook 'git-commit-mode-hook #'meow-insert))

(provide 'init-magit)
;;; init-magit.el ends here
