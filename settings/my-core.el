(provide 'my-core)

;; Not sure what this does exactly but looks important
(eval-when-compile (require 'cl))
(require 'cl-lib)

;; No splash screen
(setq inhibit-startup-screen t)

;; As the eval-after-load pattern is used to often let's make it cleaner
;; http://milkbox.net/note/single-file-master-emacs-configuration/
(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))

;; Break long lines at word boundaries
(visual-line-mode 1)

;; No lockfiles
(setq create-lockfiles nil)

;; VIM isn't Evil, tabs are
(setq-default indent-tabs-mode nil)

;; Number columns in the status bar
(column-number-mode)

;; Don't put intitial text in scratch buffer
(setq initial-scratch-message nil)

;; Make sure $PATH is set correctly
(use-package exec-path-from-shell
  :ensure exec-path-from-shell
  :config
  (progn
    (exec-path-from-shell-copy-env "PATH")
    ))
(exec-path-from-shell-initialize)

;; Store file history hidden within our emacs dir without littering
(defvar my-auto-save-folder "~/.emacs.d/.saves/"
    "Directory used for Emacs backups.")

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq auto-save-file-name-transforms
      `((".*" ,my-auto-save-folder t)))

;; Only scroll one line when near the bottom of the screen, instead
;; of jumping the screen around.
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

;; Let me write `y` or `n` even for important stuff that would normally require
;; me to fully type `yes` or `no`.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Enable the mouse in terminal mode
(xterm-mouse-mode 1)

;; UTF-8 everything
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; This isn't a typewriter (even if it is a terminal); one space after sentences,
;; please.
(setq sentence-end-double-space nil)

;; Flash the frame to represent a bell.
(setq visible-bell t)
;; Nevermind, that's annoying
(setq ring-bell-function 'ignore)

;; The default of 16 is too low. Give me a 64-object mark ring.
;; Across all files, make it 128.
(setq mark-ring-max 64)
(setq global-mark-ring-max 128)

;; Display the current function name in the modeline.
(which-function-mode 0)

;; Show me the new saved file if the contents change on disk when editing.
(global-auto-revert-mode 1)

;; Name the title based on the file
(defun my-update-emacs-title ()
  "Update the Emacs title based on the current buffer.
If the current buffer is associated with a filename, that filename will be
used to tile the window. Otherwise, the window will be titled based upon the
name of the buffer."
  (if (buffer-file-name (current-buffer))
      (setq frame-title-format "Emacs - %f")
      (setq frame-title-format "Emacs - %b")))

(cl-dolist (hook '(buffer-list-update-hook
                   change-major-mode-hook
                   find-file-hook))
  (add-hook hook 'my-update-emacs-title))
