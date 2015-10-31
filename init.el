(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "settings"))

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

;; ========= Custom Settings

(require 'my-ibuffer)
(require 'my-dired)
