;;; init-rust.el --- rust language configuration -*- lexical-binding: t -*-

(use-package rustic
  :elpaca t
  :hook ((rustic-mode . lsp-deferred)
         (rustic-mode . afterlife/rustic-mode-hook))
  :bind
  (:map rustic-mode-map
        ("C-c C-c s" . lsp-rust-analyzer-status))
  :custom
  (lsp-eldoc-render-all t)
  (lsp-inlay-hint-enable t)
  (lsp-rust-analyzer-check-command "clippy")
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-closure-return-type-hints "always")
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints "never"))

(defun afterlife/rustic-mode-hook ()
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

(provide 'init-rust)
;;; init-rust.el ends here
