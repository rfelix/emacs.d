(provide 'my-window-manager)

(use-package eyebrowse
  :ensure t
  :config
  (progn
    (eyebrowse-mode t)
    ;; Have it start a new workspace clean with just the scratch buffer
    (setq eyebrowse-new-workspace t)
    ;; Have it wrap around and go to the first when you're at the last,
    ;; just like VIM does
    (setq eyebrowse-wrap-around t)
    ;; As we're using Evil...
    (after 'evil
      (eyebrowse-setup-evil-keys))))
