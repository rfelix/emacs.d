(provide 'my-emacs)

;; Provide a visual aid to help explore emacs
(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode)
    ;; Use the minibuffer so it doesn't alter the current windows
    (which-key-setup-minibuffer)))

;; Install the awsome (fuzzy) completion & selection framework
(use-package helm
  :ensure t
  :init
  (progn
    ;; Adjust some helm particularities
    (setq helm-bookmark-show-location t
          helm-display-header-line nil
          helm-echo-input-in-header-line t)
    ; Use fuzzy-matching
    (setq helm-M-x-fuzzy-match t
          helm-apropos-fuzzy-match t
          helm-file-cache-fuzzy-match t
          helm-imenu-fuzzy-match t
          helm-lisp-fuzzy-completion t
          helm-recentf-fuzzy-match t
          helm-semantic-fuzzy-match t
          helm-buffers-fuzzy-matching t)
    )
  :config
  (progn
    (require 'helm-config)
    ;; Enable helm with various normal Emacs commands
    (helm-mode 1)
    ;; Only have help open up at the bottom of the current window rather
    ;; than always show up in the "other" window
    (setq helm-split-window-in-side-p t)
    ;; And have it auto-resize the window based on items, but not too big
    (helm-autoresize-mode 1)
    (setq helm-autoresize-max-height 40)
    ;; Use vim-like keys for navigation, taken from Spacemacs
    (define-key helm-map (kbd "C-j") 'helm-next-line)
    (define-key helm-map (kbd "C-k") 'helm-previous-line)
    (define-key helm-map (kbd "C-h") 'helm-previous-source)
    (define-key helm-map (kbd "C-l") 'helm-next-source)
    (define-key helm-map (kbd "C-S-h") 'describe-key)
    (dolist (keymap (list helm-find-files-map helm-read-file-map))
      (define-key keymap (kbd "C-l") 'helm-execute-persistent-action)
      (define-key keymap (kbd "C-h") 'helm-find-files-up-one-level)
      (define-key keymap (kbd "C-S-h") 'describe-key))
    ;; Experimental
    (define-key helm-map (kbd "C-<SPC>") 'helm-toggle-visible-mark)
    (define-key helm-map (kbd "C-v") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-u") 'helm-beginning-of-buffer)
    (define-key helm-map (kbd "C-d") 'helm-end-of-buffer)
    ;; Helm displays a big caption at the top which is a bit ugly and
    ;; distracting, so lets try remoe it as best we can
    (defun my-helm-toggle-header-line ()
      (if (= (length helm-sources) 1)
          (set-face-attribute 'helm-source-header nil :height 0.1)
        (set-face-attribute 'helm-source-header nil :height 1.0)))

    (add-hook 'helm-before-initialize-hook 'my-helm-toggle-header-line)
    ;; Switch the command execution to use Helm instead as besides giving
    ;; fuzzy search capability it also displays the corresponding keybinding
    (global-set-key (kbd "M-x") 'helm-M-x) 
    ;; Allow easy switching between buffers or recent files
    (global-set-key (kbd "C-x b") 'helm-mini)
    ;; Better find-files
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    ))
