;;; init-go.el --- go language configuration -*- lexical-binding: t -*-

(use-package go-mode
  :elpaca t
  :hook  (go-mode . lsp-deferred)
  :custom
  (gofmt-command "goimports"))

(provide 'init-go)
;;; init-go.el ends here
