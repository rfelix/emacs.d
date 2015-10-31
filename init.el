(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(setq package-enable-at-startup nil)

(add-to-list 'load-path (concat user-emacs-directory "settings"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; evil
(use-package evil-leader
	     :ensure t
	     :demand t
	     :commands (evil-leader-mode)
	     :init (global-evil-leader-mode)
	     :config
	     (progn
	       (evil-leader/set-leader ",")
	       ))

(require 'evil-leader)

(global-evil-leader-mode)

(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(evil-leader/set-key
  "w" 'save-buffer
  "q" 'kill-buffer-and-window
  "h" 'dired-jump
  "v" 'split-window-righ
  "," 'other-window
  "b" 'ibuffer
  "x" 'helm-M-x
  )

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
