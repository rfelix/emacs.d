(provide 'my-history)

;; Remember the history of commands and searches
;; Extracted from spacemacs
(use-package savehist
  :init
  (progn
    ;; Minibuffer history
    (setq savehist-file (concat user-emacs-directory "savehist")
          enable-recursive-minibuffers t ; Allow commands in minibuffers
          history-length 1000
          savehist-additional-variables '(mark-ring
                                          global-mark-ring
                                          search-ring
                                          regexp-search-ring
                                          extended-command-history)
          savehist-autosave-interval 60)
    (savehist-mode t)))

;; Track recently opened files
(use-package recentf
  :config
  (progn
    (setq recentf-max-saved-items 1000
          recentf-max-menu-items 25)
    (recentf-mode 1)
    (after 'helm
      (global-set-key (kbd "C-x C-r") 'helm-recentf))))
