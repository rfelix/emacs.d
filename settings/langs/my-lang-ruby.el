(provide 'my-lang-ruby)

;; Based on http://mixandgo.com/blog/how-i-ve-convinced-emacs-to-dance-with-ruby
(require 'ruby-mode)

;; Files with the following extensions should open in ruby-mode
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; When folding, take these delimiters into consideration
(add-to-list 'hs-special-modes-alist
             '(ruby-mode
               "\\(class\\|def\\|do\\|if\\)" "\\(end\\)" "#"
               (lambda (arg) (ruby-end-of-block)) nil))

;; Get emacs to be smart enough to run rspec tests
(use-package rspec-mode
  :ensure t
  :config
  (progn
    ;; Because we're using docker we need to force it to always use the relative
    ;; path to the spec files rather than the absolute path
    (defun my-compress-rspec-spec-file (orig-fun &rest args)
      "Always compress the rspec file"
      (let ((res (apply orig-fun args)))
        (rspec-compress-spec-file res)))
    (advice-add 'rspec-spec-file-for :around #'my-compress-rspec-spec-file)
    ;; Support using binding.pry with inf-ruby as
    ;; recommended in https://github.com/pezra/rspec-mode#debugging
    (add-hook 'after-init-hook 'inf-ruby-switch-setup)
    ;; Auto-scroll output
    (setq compilation-scroll-output t)
    ;; Don't use rake
    (setq rspec-use-rake-when-possible nil)
    ;; Nor use bundler, as we want to substitute the rspec command for docker
    (setq rspec-use-bundler-when-possible nil)
    ;; Now use docker-compose to run the commands
    (setq rspec-spec-command "docker-compose run dev bundle exec rspec")
    ))

(use-package inf-ruby
  :ensure t
  :config
  (progn
    (add-to-list 'inf-ruby-implementations
                 '("docker-irb" . "docker-compose run dev bundle exec irb") t)
    (add-to-list 'inf-ruby-implementations
                 '("docker-pry" . "docker-compose run dev bundle exec pry") t)
    (setq inf-ruby-default-implementation "docker-irb")
    ))
