;; Remove useless GUI artifacts as soon as possible to we don't even notice
;; they were there to start with
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

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

;; ========= Custom Settings

(require 'my-core)
(require 'my-evil)
(require 'my-ibuffer)
(require 'my-dired)
(require 'my-elisp-slime-nav)
(require 'my-magit)
(require 'my-evil-leader-keys) ;; Let this come last
