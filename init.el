(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; evil

(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; elisp-slimee-nav

(require 'elisp-slime-nav)

(defun my-lisp-hook ()
  (elisp-slime-nav-mode)
  (turn-on-eldoc-mode)
  )

(add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)

(evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
  'elisp-slime-nav-describe-elisp-thing-at-point)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ibuffer
(eval-after-load 'ibuffer
  '(progn
     (evil-set-initial-state 'ibuffer-mode 'normal)
     (evil-define-key 'normal ibuffer-mode-map
       (kbd "j") 'evil-next-line ; Original - 'ibuffer-jump-to-buffer
       (kbd "J") 'ibuffer-jump-to-buffer
       (kbd "k") 'evil-previous-line ; Original - 'ibuffer-mark-for-delete
       (kbd "l") 'ibuffer-visit-buffer ; Original - 'ibuffer-redisplay
       (kbd "v") 'ibuffer-toggle-marks ; Original - 'ibuffer-do-view
       )))
