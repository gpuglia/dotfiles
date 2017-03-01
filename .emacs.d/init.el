(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" default)))
 '(package-selected-packages
   (quote
    (helm-gtags haml-mode web-mode company company-mode helm-ag color-theme-sanityinc-tomorrow rspec-mode evil-leader flx-ido smex ido-vertical-mode helm-projectile helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'base16-eighties t)
(set-frame-font "Monaco-15")

;; Set $PATH for rbenv
(setenv "PATH"
 (concat (getenv "HOME") "/.rbenv/shims:"
  (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))

(setq exec-path
 (cons (concat (getenv "HOME") "/.rbenv/shims")
  (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

;; Look for executables in /usr/local/bin
(setq exec-path (append exec-path '("/usr/local/bin")))

(load-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

;; Appearance
(setq ring-bell-function 'ignore)
(tool-bar-mode 0)
(menu-bar-mode 0)
(when window-system
  (scroll-bar-mode -1))

;; Scrolling
(setq scroll-conservatively 100)

;; Indentation and tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq python-indent 2)


(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package diminish
  :ensure t)

(use-package ido-vertical-mode
  :ensure t
  :config
   (ido-mode 1)
   (ido-vertical-mode 1)
   (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex))

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode 1))

(use-package helm
  :ensure t
  :config
  (defun my-helm-init ()
    (define-key helm-map (kbd "<escape>") 'helm-keyboard-quit))
  (helm-mode 1)
  (add-hook 'after-init-hook 'my-helm-init)
  :diminish helm

  :init
  (use-package helm-projectile
    :ensure t)

  (use-package helm-ag
    :ensure t
    :config
    (setq helm-ag-base-command "/usr/local/bin/ag --nogroup --ignore-case"))

  (use-package helm-gtags
    :ensure t
    :config
    (helm-gtags-mode 1)))

(use-package projectile
  :ensure t
  :defer 1
  :diminish projectile
  :config
  (projectile-mode))

(use-package rspec-mode
  :ensure t
  :config
  (setq rspec-spec-command "bin/rspec")
  (setq rspec-use-bundler-when-possible nil)
  (setq rspec-use-spring-when-possible nil))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package web-mode
  :ensure t)

(use-package haml-mode
  :ensure t)

(use-package ruby-mode
  :ensure t
  :config
  (setq ruby-insert-encoding-magic-comment nil))

(use-package evil
  :ensure t
  :config

  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")
    (evil-leader/set-key
     "a" 'rspec-verify-all
     "b" 'helm-mini
     "f" 'helm-gtags-dwim
     "l" 'rspec-rerun
     "s" 'rspec-verify-single
     "t" 'helm-projectile
     "T" 'helm-projectile-switch-project
     "vv" 'split-window-horizontally
     "gg" 'helm-ag
     "x" 'helm-M-x))

  (evil-mode 1))

;; Javascript and Coffeescripts
(setq js-indent-level 2)

(add-hook 'coffee-mode-hook
          (lambda ()
            (setq coffee-tab-width 2)))

;; Split horizontally for temporary buffer
(defun hrs/split-horizontally-for-temp-buffers ()
  (when (one-window-p t)
    (split-window-horizontally)))

(add-hook 'temp-buffer-window-setup-hook
          'hrs/split-horizontally-for-temp-buffers)