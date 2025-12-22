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

;; set bash as the default shell
(setq explicit-shell-file-name "/usr/bin/bash")
(setq shell-file-name "/usr/bin/bash")

;; Enable transient mark mode
(transient-mark-mode 1)

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

;; set up org-mode global bindings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; set sensible defaults
(setq-default fill-column 80)
(setq display-time-12hr-format t)
(display-time)
(global-visual-line-mode t) ;; soft word wrap in display

;; start sr-speedbar
(defun start-sr-speedbar ()
  (sr-speedbar-open))
(add-hook 'window-setup-hook 'start-sr-speedbar)

;; setup C# coding utils
(use-package csharp-mode :ensure t :init
  (add-hook 'csharp-mode-hook #'company-mode)
  (add-hook 'csharp-mode-hook #'rainbow-delimiters-mode))

(use-package company :ensure t :mode "company-mode")
(use-package company-box :ensure t
  :hook (company-mode . company-box-mode))

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook ((csharp-mode . lsp)
	 (python-mode . (lambda ()
			  (require 'lsp-python-ms)
			  (lsp))))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package flycheck
	     :ensure t
	     :init (global-flycheck-mode))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)
