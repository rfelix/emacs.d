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
