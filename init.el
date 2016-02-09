;; Remove useless GUI artifacts as soon as possible to we don't even notice
;; they were there to start with
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'package)
;; Locks to specific version of packages
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Based on the latest commit in master for each package
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; Maintainers explicitly upload the package
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

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
(require 'my-appearance)
(require 'my-buffers)
(require 'my-dired)
(require 'my-emacs)
(require 'my-history)
(require 'my-navigation)
(require 'my-magit)
(require 'my-lang)
(require 'my-terminal)
(require 'my-evil-leader-keys) ;; Let this come last

;; === End of Settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
