(provide 'my-evil-leader-keys)

(evil-leader/set-key
  "w" 'save-buffer
  "q" 'kill-buffer-and-window
  "h" 'dired-jump
  "v" 'split-window-right
  "," 'other-window
  "b" 'helm-buffers-list
  "x" 'helm-M-x
  "t" 'helm-projectile-find-file
  "p" 'helm-projectile-switch-project
  )
