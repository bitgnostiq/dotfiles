;;; init-completion.el --- completion stack -*- lexical-binding: t; -*-
;;; Code:

(use-package vertico
  :elpaca t
  :init
  (vertico-mode)
  :hook
  (rfn-eshadow-update-overlay . vertico-directory-tidy))


(use-package marginalia
  :elpaca t
  :hook (after-init . marginalia-mode))

(elpaca-wait)

(use-package orderless
  :elpaca t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion))))
  (orderless-component-separator #'orderless-escapable-split-on-space))

(use-package consult
  :elpaca t
  :defer t
  :init
  (setq xref-show-xrefs-function    #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :bind (
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ("s-i" . consult-imenu)
         ;; M-s bindings (search-map)
         ("M-s f" . consult-find)
         ("M-s F" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines))
  :config
  ;; press < followed by a group key to narrow the candidates to one
  ;; group (e.g. in consult-buffer: < b for buffers, < f for files,
  ;; < p for project buffers); < again removes the narrowing
  (setq consult-narrow-key "<"))


(use-package company
  :elpaca t
  :hook
  ((after-init   . global-company-mode)
   (prog-mode    . electric-pair-mode)
   (org-src-mode . company-mode))
  :bind
  (:map company-active-map
        ("<tab>"    . company-complete-selection)
        ("TAB"      . company-complete-selection)
        ("<return>" . nil)
        ("RET"      . nil))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.2)
  (company-selection-wrap-around t)
  :config
  (company-tng-mode 1)
  (setq company-backends
        '((company-capf :with company-files :separate))))



(provide 'init-completion)
;;; init-completion.el ends here
