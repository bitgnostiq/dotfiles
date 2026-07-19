;;; init-meow.el --- modal editing configuration -*- lexical-binding: t; -*-

(defun afterlife/meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)



  (meow-leader-define-key
   '("?" . meow-cheatsheet)

   ;; Files and Consult
   '("f f" . find-file)
   '("f c" . (lambda () (interactive) (dired user-emacs-directory)))
   '("f s" . save-buffer)
   '("f r" . consult-recent-file)
   '("f d" . dired)
   '("f j" . dired-jump)

   ;; Buffers
   '("b s" . consult-buffer)
   '("b k" . (lambda () (interactive) (kill-buffer (current-buffer))))
   '("b l" . (lambda () (interactive) (switch-to-buffer nil)))
   '("b x" . scratch-buffer)
   '("b n" . next-buffer)
   '("b p" . previous-buffer)
   '("b f" . apheleia-format-buffer)

   ;; Windows
   '("w w" . other-window)
   '("w v" . split-window-right)
   '("w s" . split-window-below)
   '("w q" . delete-window)
   '("w o" . delete-other-windows)

   ;; Magit
   '("g" . magit-status)

   ;; LSP
   '("l s" . lsp-workspace-shutdown)
   '("l r" . lsp-workspace-restart)
   '("l d" . lsp-describe-session)
   '("l v" . lsp-version)

   '("l g d" . lsp-ui-peek-find-definitions)
   '("l g D" . xref-find-definitions-other-window)
   '("l g r" . lsp-ui-peek-find-references)
   '("l g i" . lsp-ui-peek-find-implementation)
   '("l g h" . lsp-describe-thing-at-point)

   '("l c a" . lsp-execute-code-action)
   '("l c r" . lsp-rename)

   ;; Compile / shell
   '("c c" . compile)
   '("c r" . recompile)
   '("c k" . kill-compilation)
   '("c s" . shell-command)
   '("c S" . async-shell-command)


   ;; Toggle
   '("t f" . toggle-frame-fullscreen)
   '("t l" . display-line-numbers-mode)
   '("t t" . consult-theme)


   ;; Org
   '("o a" . org-agenda)

   ;; Help
   '("h f" . describe-function)
   '("h v" . describe-variable)
   '("h k" . describe-key)
   '("h b" . describe-bindings)
   '("h i" . consult-info)

   ;; meow digits
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument))

  (meow-normal-define-key

   ;; Numeric expand
   '("0" . meow-expand-0)
   '("1" . meow-expand-1)
   '("2" . meow-expand-2)
   '("3" . meow-expand-3)
   '("4" . meow-expand-4)
   '("5" . meow-expand-5)
   '("6" . meow-expand-6)
   '("7" . meow-expand-7)
   '("8" . meow-expand-8)
   '("9" . meow-expand-9)
   '("-" . negative-argument)

   ;; Movement
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)

   ;; Word / symbol
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)

   ;; Goto prefix
   '(":" . consult-goto-line)
   '("g g" . beginning-of-buffer)
   '("g e" . end-of-buffer)
   '("g h" . beginning-of-line)
   '("g l" . end-of-line)
   '("g d" . xref-find-definitions)
   '("g r" . xref-find-references)
   '("g i" . imenu)
   '("G" . meow-grab)

   ;; Selection / thing
   '("x" . meow-line)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '(";" . meow-reverse)
   '("z" . meow-pop-selection)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("*" . meow-mark-symbol)

   ;; Edit
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("s" . meow-kill)
   '("c" . meow-change)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("m" . meow-join)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("/" . comment-dwim)

   ;; Yank / paste
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("p" . meow-yank)
   '("P" . meow-yank-pop)

   ;; Insert
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("a" . meow-append)
   '("A" . meow-open-below)

   ;; Search
   '("v" . meow-visit)
   '("V" . meow-search)

   ;; Find / till (use ; to reverse)
   '("f" . meow-find)
   '("F" . query-replace)
   '("t" . meow-till)

   ;; Misc
   '("`" . meow-cancel-selection)
   '("'" . repeat)
   '("<escape>" . ignore)


   '("M-<up>"   . move-text-up)
   '("M-<down>" . move-text-down)
   '("M-<left>" . backward-word)
   '("M-<right>". forward-word)))


(use-package meow
  :elpaca t
  :config
  (afterlife/meow-setup)
  (meow-global-mode 1)
  (meow-thing-register 'angle
                       '(regexp "<" ">")
                       '(regexp "<" ">"))
  (meow-thing-register 'double-quote
                       '(regexp "\"" "\"")
                       '(regexp "\"" "\""))
  (meow-thing-register 'single-quote
                       '(regexp "'" "'")
                       '(regexp "'" "'"))
  (meow-thing-register 'backtick
                       '(regexp "`" "`")
                       '(regexp "`" "`"))
  (setq meow-char-thing-table
        '((?\( . round)
          (?\[ . square)
          (?\{ . curly)
          (?\< . angle)
          (?\" . double-quote)
          (?\' . single-quote)
          (?\` . backtick)
          (?e . symbol)
          (?w . window)
          (?b . buffer)
          (?p . paragraph)
          (?l . line)
          (?d . defun))))


(use-package move-text
  :elpaca t)

(defun afterlife/reload-config ()
  (interactive)
  (load-file user-init-file)
  (message "Config reloaded."))
(global-set-key (kbd "C-c r") #'afterlife/reload-config)

(provide 'init-meow)
;;; init-meow.el ends here
