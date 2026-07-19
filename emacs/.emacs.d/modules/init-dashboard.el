;;; init-dashboard.el --- dashboard configuration -*- lexical-binding: t -*-

(use-package dashboard
  :elpaca t
  :custom
  (dashboard-banner-logo-title "")
  (dashboard-startup-banner "~/.emacs.d/banner/logo.txt")
  (dashboard-center-content t)
  (dashboard-vertically-center-content t)
  (dashboard-show-shortcuts nil)
  (dashboard-items '((recents . 5)
                     (agenda . 5)))
  :config
  (dashboard-initialize)
  (add-hook 'elpaca-after-init-hook #'dashboard-open))

(provide 'init-dashboard)
;;; init-dashboard.el ends here
