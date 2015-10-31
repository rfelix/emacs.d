(provide 'my-dired)

;; Bring in additional functionality such as dired-jump
(require 'dired-x)

;; Ensure dired doesn't ask us if we want to use this funcitonality when we make
;; use of the "l" while in dired mode
(put 'dired-find-alternate-file 'disabled nil)

(defun my-dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternative-file"
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)
  ))

;; Make it so that "l" drills down into a directory but without opening a new dired buffer
(evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
;; Make it so that "h" behaves like "l" and doens't open up a new buffer when going up
(evil-define-key 'normal dired-mode-map "h" 'my-dired-up-directory)
(evil-define-key 'normal dired-mode-map "o" 'dired-sort-toggle-or-edit)
;; Match the same interface as ibuffer with "v"
(evil-define-key 'normal dired-mode-map "v" 'dired-toggle-marks)
(evil-define-key 'normal dired-mode-map "m" 'dired-mark)
(evil-define-key 'normal dired-mode-map "u" 'dired-unmark)
(evil-define-key 'normal dired-mode-map "U" 'dired-unmark-all-marks)
(evil-define-key 'normal dired-mode-map "c" 'dired-create-directory)
;; The same functionality "n" is mapped to "j" so we can re-use it to make
;; "n" and "N" behave more like vim-searching
(evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
(evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
(evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)

