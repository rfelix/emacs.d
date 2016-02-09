(provide 'my-evil)

;; Use Ctrl-U to scroll half a page up
(setq evil-want-C-u-scroll t)

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

;; This basically allows assigning pairs of simultaneously pressed
;; keys to commands, but will be used to have a quick way to exit
;; evil's insert mode to normal mode
(use-package key-chord
  :ensure t
  :config
  (progn
    (key-chord-mode 1)
    (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
    ))

;; Simulate VIM where pressing * will cause a search for the word
;; under the cursor
(use-package evil-search-highlight-persist
  :ensure t
  :config
  (progn
    (global-evil-search-highlight-persist t)
    ;; Only display string whose length is greater than or equal to 3
    (setq evil-search-highlight-string-min-len 3)
    ))

(use-package evil-visualstar
  :ensure t
  :config
  (progn
    (global-evil-visualstar-mode t)
    ))

;; Simulate VIM's Ctrl+i and Ctrl+o functionality between files and buffers
(use-package evil-jumper
  :ensure t
  :config
  (progn
    (evil-jumper-mode)
    ))
