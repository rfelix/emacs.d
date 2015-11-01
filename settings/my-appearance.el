(provide 'my-appearance)

(set-face-attribute 'default
                    nil
                    :family "Source Code Pro for Powerline"
                    :height 160
                    :weight 'normal)

;; Display column/row of cursor
(column-number-mode 1)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; Highlight matching parenthesis
;; (show-paren-mode 1) ;; Not too sure on this one...

;; This theme works the best when using emacs from the console as long
;; as you're using the corresponding Solarized color preset iTerm 2
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "custom-themes/emacs-color-theme-solarized"))

;; This theme works the best with the GUI version of emacs
(use-package color-theme-sanityinc-solarized
  :ensure t)

(defun my-load-solarized-theme ()
  "Load the solarized theme that best matches the environment emacs
is running in. In console mode, load the theme that works best with
the solarized color pallet, while for the GUI version load a different
theme that works better"
  (interactive)
  (if window-system
      ;; Load the theme best suited for the GUI
      (load-theme 'sanityinc-solarized-dark t)
    ;; Otherwise just load the theme best suited for the console
    (setq solarized-broken-srgb t)
    (set-frame-parameter nil 'background-mode 'dark)
    (set-terminal-parameter nil 'background-mode 'dark)
    (load-theme 'solarized t)))

;; Now we want to ensure that when opened within the console we use the
;; right solarized theme, but when opened within the GUI we use the other.
(my-load-solarized-theme)

;; We need to set the theme only within the context of a frame due to
;; the way emacs works as there can be multiple frames, one being in
;; a GUI while another in a terminal (using the emacs server)
;; http://stackoverflow.com/a/5801740
(add-hook 'after-make-frame-functions
          (my-load-solarized-theme))
