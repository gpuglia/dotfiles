(require 'package)

;;; Code:
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
 '(ansi-term-color-vector
    [unspecified "#2b303b" "#bf616a" "#a3be8c" "#ebcb8b" "#8fa1b3" "#b48ead" "#8fa1b3" "#c0c5ce"])
 '(company-backends
    (quote
     (company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                   (company-dabbrev-code company-gtags company-keywords)
                   company-oddmuse company-dabbrev)))
 '(custom-safe-themes
    (quote
     ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "10e231624707d46f7b2059cc9280c332f7c7a530ebc17dba7e506df34c5332c4" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "db2ecce0600e3a5453532a89fc19b139664b4a3e7cbefce3aaf42b6d9b1d6214" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "25c242b3c808f38b0389879b9cba325fb1fa81a0a5e61ac7cae8da9a32e2811b" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" default)))
 '(evil-commentary-mode t)
 '(package-selected-packages
    (quote
     (restclient diminish base16-theme flycheck nlinum evil-indent-textobject evil-surround popwin evil-matchit ruby-refactor ruby-end coffee-mode arjen-grey-theme multi-term handlebars-mode exec-path-from-shell evil-commentary magit yaml-mode spacegray-theme evil-rails yasnippet yassnippet helm-gtags haml-mode web-mode company company-mode helm-ag color-theme-sanityinc-tomorrow rspec-mode evil-leader flx-ido smex ido-vertical-mode helm-projectile helm evil)))
 '(popwin-mode t)
 '(safe-local-variable-values (quote ((projectile-project-name . "org")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:inherit nil :stipple nil :background "#2b303b" :foreground "#c0c5ce" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 160 :width condensed :foundry "nil" :family "Fira Mono"))))
)

(set-frame-font "Monaco-15")
(load-theme 'base16-ocean t)

;; Look for executables in /usr/local/bin
(setq exec-path (cons "/usr/local/bin" exec-path))

;; Set $PATH for rbenv
(setenv "PATH"
(concat (getenv "HOME") "/.rbenv/shims:"
 (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))

(setq exec-path
 (cons (concat (getenv "HOME") "/.rbenv/shims")
  (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))


(load-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

;; Appearance
(setq ring-bell-function 'ignore)
(tool-bar-mode 0)
(menu-bar-mode 0)
(when window-system
  (scroll-bar-mode -1))
(setq linum-format "%2d ")
(fringe-mode -1)
(blink-cursor-mode 0)

;; Wrapping text
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'gfm-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Scrolling
(setq scroll-conservatively 100)
(setq compilation-scroll-output t)

;; Indentation and tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Org-mode
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t )
(setq org-src-window-setup 'current-window)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (python . t)))
(setq org-confirm-babel-evaluate nil)
(setq org-log-done 'time)
(setq org-directory "~/org")
(setq org-agenda-files (list org-index-file))
(add-hook 'org-capture-mode-hook 'evil-insert-state)

(define-key org-mode-map (kbd "C-c C-x C-s") 'hrs/mark-done-and-archive)
(define-key global-map "\C-cc" 'org-capture)

(require 'ox-md)

(defun org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))

(setq org-inbox-file "~/org/inbox.org")
(setq org-index-file (org-file-path "index.org"))
(setq org-archive-location
      (concat (org-file-path "archive.org") "::* From %s"))

(defun hrs/mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))

(defun open-index-file ()
  "Open the master org TODO list."
  (interactive)
  (find-file org-index-file)
  (end-of-buffer))

(global-set-key (kbd "C-c i") 'open-index-file)

(setq org-capture-templates
  '(("l" "Today I Learned..."
    entry
    (file+datetree (org-file-path "til.org"))
    "* %?\n")


    ("t" "Todo"
      entry
      (file+headline org-index-file "Tasks")
     "* TODO %?\n")))

(defun org-capture-todo ()
  (interactive)
  (org-capture :keys "t"))

(global-set-key (kbd "M-n") 'org-capture-todo)

;; Packages
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

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init (global-flycheck-mode))

(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  (defun my-helm-init ()
    (define-key helm-map (kbd "<escape>") 'helm-keyboard-quit))
  (add-hook 'after-init-hook 'my-helm-init)

  (helm-mode 1)
  :init
  (use-package helm-projectile
    :ensure t)

  (use-package helm-ag
    :ensure t
    :config
    (setq helm-ag-base-command "/usr/local/bin/ag --nogroup --ignore-case"))

  (use-package helm-gtags
    :diminish helm-gtags-mode
    :ensure t
    :config
    (helm-gtags-mode 1)))

(use-package projectile
  :ensure t
  :defer 1
  :diminish projectile-mode
  :config
  (setq projectile-completion-system 'helm)
  (projectile-mode))

(use-package popwin
  :ensure t
  :config
  (push '("^CAPTURE-.+\*.org$" :regexp t :position bottom) popwin:special-display-config)
  (push '("*rspec-compilation*" :height 0.4 :noselect t) popwin:special-display-config)
  (push '("*Org Select*" :height 0.3 :position bottom) popwin:special-display-config)
  (push '("*Warnings*") popwin:special-display-config)
  (push '("^\*helm.+\*$" :regexp t :height 0.4) popwin:special-display-config)
  (add-hook 'helm-after-initialize-hook (lambda ()
                                          (popwin:display-buffer helm-buffer t)
                                          (popwin-mode -1)))

 ;;  Restore popwin-mode after a Helm session finishes.
 (add-hook 'helm-cleanup-hook (lambda () (popwin-mode 1)))
  (popwin-mode 1))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package undo-tree
  :diminish undo-tree-mode)

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs
      '("~/.emacs.d/snippets")))

(use-package web-mode
  :ensure t)

(use-package haml-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

 (use-package coffee-mode
   :ensure t)

(use-package ruby-mode
  :ensure t
  :config
  (use-package inf-ruby
    :ensure t
    :config
    (setq inf-ruby-breakpoint-pattern "\\(\\[1\\] .+ ~ »\\)\\|\\(\\[1\\] pry(\\)\\|\\((rdb:1)\\)\\|\\((byebug)\\)")

    (setq inf-ruby-prompt-format (concat "\\(\\[[1-9]+\\] .+ ~ »\\)\\|" inf-ruby-prompt-format))
    (setq inf-ruby-first-prompt-pattern (format inf-ruby-prompt-format ">" ">"))
    (setq inf-ruby-prompt-pattern (format inf-ruby-prompt-format "[?>]" "[\]>*\"'/`]"))

    (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
    (add-hook 'ruby-mode-hook
    (function (lambda ()
            (setq evil-shift-width ruby-indent-level))))
    (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter))

  (use-package ruby-end
   :ensure t)

  (use-package ruby-refactor
    :ensure t)

  (yas-global-mode 1)
  (setq ruby-insert-encoding-magic-comment nil)
  (add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch))

(use-package rspec-mode
  :ensure t
  :config
  (setq rspec-spec-command "bin/rspec")
  (setq rspec-use-bundler-when-possible nil)
  (setq rspec-use-spring-when-possible nil)
  (add-hook 'rspec-compilation-mode-hook
          (lambda ()
            (make-local-variable 'compilation-scroll-output)
            (setq compilation-scroll-output 'first-error)))
  (add-hook 'after-init-hook 'inf-ruby-switch-setup))

;; Python
(setq python-indent 4)
(setq python-shell-interpreter "/usr/local/bin/python")

(use-package evil
  :ensure t
  :config

  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")
    (evil-leader/set-key
     "a" 'rspec-verify-matching
     "b" 'helm-mini
     "f" 'helm-gtags-dwim
     "jm" 'projectile-rails-find-model
     "jc" 'projectile-rails-find-controller
     "js" 'projectile-rails-find-spec
     "jv" 'projectile-rails-find-view
     "l" 'rspec-rerun
     "s" 'rspec-verify-single
     "t" 'helm-projectile
     "T" 'helm-projectile-switch-project
     "vv" 'split-window-horizontally
     "gg" 'helm-ag-project-root
     "x" 'helm-M-x))

  (use-package evil-rails
    :ensure t)

  (use-package evil-commentary
    :ensure t
    :diminish evil-commentary-mode
    :config
    (evil-commentary-mode))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t)

  (use-package evil-matchit
    :ensure t
    :diminish evil-matchit-mode
    :config
    (global-evil-matchit-mode 1))

  (evil-ex-define-cmd "A"  'projectile-toggle-between-implementation-and-test)
  (evil-ex-define-cmd "AV" '(lambda ()
                              (interactive)
                              (evil-window-vsplit)
                              (windmove-right)
                              (projectile-toggle-between-implementation-and-test)))
  (evil-ex-define-cmd "AS" '(lambda ()
                              (interactive)
                              (evil-window-split)
                              (windmove-down)
                              (projectile-toggle-between-implementation-and-test)))

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
