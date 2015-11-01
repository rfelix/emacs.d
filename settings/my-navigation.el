(provide 'my-navigation)

;; Use projectile for managing projects with git
(use-package projectile
  :ensure t
  :config
  (progn
    (projectile-global-mode)
    ))

;; And use Helm with Projectile to get VIM's CtrlP like functionality
(use-package helm-projectile
  :ensure t
  :config
  (progn
    (setq projectile-completion-system 'helm)
    (helm-projectile-on)
    ))
