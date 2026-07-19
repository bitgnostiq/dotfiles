;;; init-csharp.el --- csharp language configuration -*- lexical-binding: t -*-

(use-package csharp-mode
  :elpaca nil
  :hook (csharp-mode . lsp-deferred))

(provide 'init-csharp)
;;; init-csharp.el ends here
