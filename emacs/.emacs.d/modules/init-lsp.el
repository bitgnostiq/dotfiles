;;; init-lsp.el --- LSP and diagnostics configuration -*- lexical-binding: t -*-

(use-package flycheck
  :elpaca t
  :hook (after-init . global-flycheck-mode))

(use-package lsp-mode
  :elpaca t
  :commands lsp
  :hook ((prog-mode . afterlife/lsp-deferred-unless-elisp))
  :bind
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (lsp-keymap-prefix nil)
  (lsp-completion-provider :none)
  (lsp-diagnostics-provider :flycheck)
  (lsp-keep-workspace-alive nil)
  (lsp-log-io nil)
  (lsp-idle-delay 0.5)
  (lsp-eldoc-enable-hover nil)
  :config
  (lsp-enable-which-key-integration t))

(defun afterlife/lsp-deferred-unless-elisp ()
  (unless (derived-mode-p 'emacs-lisp-mode 'lisp-interaction-mode)
    (lsp-deferred)))


(use-package lsp-ui
  :elpaca t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-show-with-cursor nil)
  (lsp-ui-doc-show-with-mouse nil)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-doc-header nil))

(provide 'init-lsp)
;;; init-lsp.el ends here
