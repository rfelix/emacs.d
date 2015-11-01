(provide 'my-emacs)

;; Provide a visual aid to help explore emacs
(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode)
    ;; Use the minibuffer so it doesn't alter the current windows
    (which-key-setup-minibuffer)))
