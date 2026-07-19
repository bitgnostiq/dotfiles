;;; init-org.el --- org mode settings -*- lexical-binding: t -*-

(use-package org
  :elpaca nil
  :defer t
  :mode ("\\.org\\(\\|_archive\\(_20[0-9][0-9]\\)?\\)$" . org-mode)
  :config

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAITING(w@/!)" "|" "DONE(d)" "CANCELLED(c@/!)")))
  (setq-default org-enforce-todo-dependencies t)
  (setq org-use-fast-todo-selection t))

(provide 'init-org)
;;; init-org.el ends here
