(provide 'my-evil)

(use-package evil-leader
  :ensure t
  :demand t
  :commands (evil-leader-mode)
  :init (global-evil-leader-mode)
  :config
  (progn
    (evil-leader/set-leader ",")
    ))

(use-package evil
  :ensure t
  :demand t
  :init (evil-mode 1)
  :config
  (progn
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    ))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
