;;; init-dired.el --- dired configuration -*- lexical-binding: t -*-

(use-package dired
  :elpaca nil
  :bind
  (:map dired-mode-map
        ("u" . dired-up-directory)
        ("j" . dired-next-line)
        ("k" . dired-previous-line)
        ("n" . dired-create-empty-file)
        ("N" . dired-create-directory))
  :custom
  (dired-dwim-target t)
  (delete-by-moving-to-trash t))



(provide 'init-dired)
;;; init-dired.el ends here
