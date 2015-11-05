(provide 'my-terminal)

(use-package multi-term
  :ensure t
  :config
  (progn
    (setq multi-term-program "/bin/zsh")
    (setq multi-term-program-switches "--login")
    ;; Make the history scrollback larger
    (add-hook 'term-mode-hook
              (lambda ()
                (setq term-buffer-maximum-size 10000)))
    (add-hook 'term-mode-hook 'evil-emacs-state)
    ))
