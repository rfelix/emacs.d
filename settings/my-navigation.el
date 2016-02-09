(provide 'my-navigation)

;; Use projectile for managing projects with git
(use-package projectile
  :ensure t
  :config
  (progn
    ;; Allow projectile to work even in directories without a VCS repo
    (setq projectile-require-project-root nil)
    (projectile-global-mode)
    ))

;; And use Helm with Projectile to get VIM's CtrlP like functionality
(use-package helm-projectile
  :ensure t
  :config
  (progn
    (after 'helm
      (setq projectile-completion-system 'helm)
      (helm-projectile-on))))
