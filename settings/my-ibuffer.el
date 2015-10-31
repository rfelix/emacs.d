(provide 'my-ibuffer)

(after 'ibuffer
  (evil-set-initial-state 'ibuffer-mode 'normal)

  (evil-define-key 'normal ibuffer-mode-map
    (kbd "j") 'evil-next-line ; Original - 'ibuffer-jump-to-buffer
    (kbd "J") 'ibuffer-jump-to-buffer
    (kbd "k") 'evil-previous-line ; Original - 'ibuffer-mark-for-delete
    (kbd "l") 'ibuffer-visit-buffer ; Original - 'ibuffer-redisplay
    (kbd "v") 'ibuffer-toggle-marks ; Original - 'ibuffer-do-view
    ))
