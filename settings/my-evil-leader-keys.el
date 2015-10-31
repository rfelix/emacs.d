(provide 'my-evil-leader-keys)

(evil-leader/set-key
  "w" 'save-buffer
  "q" 'kill-buffer-and-window
  "h" 'dired-jump
  "v" 'split-window-right
  "," 'other-window
  "b" 'ibuffer
  "x" 'helm-M-x
  )
