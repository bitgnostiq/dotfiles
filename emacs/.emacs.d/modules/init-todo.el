;;; init-todo.el --- highlight TODO/FIXME keywords -*- lexical-binding: t -*-

(use-package hl-todo
  :elpaca t
  :hook (prog-mode . hl-todo-mode))


(provide 'init-todo)
;;; init-hl-todo.el ends here
