(provide 'my-buffers)

;; Better names for duplicate buffers
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward
        uniquify-separator "/"
        uniquify-ignore-buffers-re "^\\*" ; leave special buffers alone
        uniquify-after-kill-buffer-p t))

(after 'evil
  (evil-set-initial-state 'ibuffer-mode 'normal)

  (evil-define-key 'normal ibuffer-mode-map
    (kbd "j") 'evil-next-line ; Original - 'ibuffer-jump-to-buffer
    (kbd "J") 'ibuffer-jump-to-buffer
    (kbd "k") 'evil-previous-line ; Original - 'ibuffer-mark-for-delete
    (kbd "l") 'ibuffer-visit-buffer ; Original - 'ibuffer-redisplay
    (kbd "v") 'ibuffer-toggle-marks ; Original - 'ibuffer-do-view
    ))
