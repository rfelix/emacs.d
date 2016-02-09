(provide 'my-lang-ruby)

;; Based on http://mixandgo.com/blog/how-i-ve-convinced-emacs-to-dance-with-ruby
(use-package ruby-mode
  :ensure t
  :mode (("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode)
         ("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\|Vagrantfile\\)\\'" . ruby-mode))
  :config
  (progn
    ;; When folding, take these delimiters into consideration
    (add-to-list 'hs-special-modes-alist
                 '(ruby-mode
                   "\\(class\\|def\\|do\\|if\\)" "\\(end\\)" "#"
                   (lambda (arg) (ruby-end-of-block)) nil))))

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
