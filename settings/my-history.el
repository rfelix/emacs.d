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

;; Track recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
