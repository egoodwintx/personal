;;------------------------------
;; egoodwin-universal.el
;; author: Ed Goodwin
;; date: 1/11/2013
;;
;; 
;;
;; Coltwood Capital (c)2013
;; All rights reserved
;; 
;;------------------------------

;; to make emacs recognize as a package
(provide 'egoodwin-universal)

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; set bash as the default shell
(setq explicit-shell-file-name "/usr/bin/bash")
(setq shell-file-name "/usr/bin/bash")

;; Enable useful settings
(transient-mark-mode 1)
(recentf-mode 1)
(global-hl-line-mode t)

;; set different location for Custom file
(setq custom-file (locate-user-emacs-file "site-lisp/egoodwin-custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;     (normal-top-level-add-subdirs-to-load-path))
(require 'package)
;; give vertical frames
;;(split-window-horizontally)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/autothemer.html"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(package-initialize)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Enable Markdown Mode
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.txt" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.txt" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist      
      (cons '("\\.mmd" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist      
      (cons '("\\.mmd.txt" . markdown-mode) auto-mode-alist))


;; enable C# mode
(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))

;; set up org-mode global bindings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c d") #'comint-clear-buffer)

;; set sensible defaults
(setq-default fill-column 80)
(setq display-time-12hr-format t)
(display-time)
(global-visual-line-mode t) ;; soft word wrap in display

;; start sr-speedbar
;;(defun start-sr-speedbar ()
;;  (sr-speedbar-open))
;;(add-hook 'window-setup-hook 'start-sr-speedbar)


;; use company-mode
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 1)
  (global-company-mode t))

(use-package lsp-mode
  :ensure t
  :hook (csharp-mode . lsp)
  :commands lsp
  :custom
  ;; This is the "magic" line that connects LSP to Company
  (lsp-completion-provider :capf)
  :config
  (lsp-enable-which-key-integration t))

;; setup C# coding utils
;; need to add csharp-ls to the dotnet toolset
;;  run 'dotnet tool install --global csharp-ls
;;  then make sure to add the following to your bash PATH
;;  export PATH="$PATH:/home/egoodwin/.dotnet/tools
;;  currently csharp-ls runs on the dotnet 9.0 toolkit
(use-package csharp-mode
  :ensure t
  :mode "\\.cs\\'"  ;; <--- This tells Emacs: "Open .cs files with this mode"
  :init
  (add-hook 'csharp-mode-hook #'company-mode)
;;  (add-hook 'csharp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'csharp-mode-hook #'lsp)) ;; Enable LSP for intellisense/highlighting

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;;(use-package flycheck
;;	     :ensure t
;;	     :init (global-flycheck-mode))

;; golden-ratio setup
(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode)
  )

;; icon setup
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :ensure t
  :defer
  :hook (marginalia-mode . #'all-the-icons-marginalia-set)
  :init
  (all-the-icons-completion-mode))

(use-package all-the-icons-dired
  :ensure t
  :defer
  :init
  (all-the-icons-dired-mode))

(use-package treemacs-all-the-icons
  :ensure t
  :defer
  :init
  )

;; start treemacs
(add-hook 'emacs-startup-hook 'treemacs)

(require 'dashboard)
(dashboard-setup-startup-hook)



