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

(require 'my-evil)
(require 'my-ibuffer)
(require 'my-dired)
(require 'my-evil-leader-keys)
