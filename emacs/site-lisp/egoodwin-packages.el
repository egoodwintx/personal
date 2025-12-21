;;------------------------------
;; egoodwin-packages.el
;; author: Ed Goodwin
;; date: 1/1/2023
;;
;; 
;;
;; Coltwood Capital (c)2023
;; All rights reserved
;; 
;;------------------------------

;; to make emacs recognize as a package
(provide 'egoodwin-packages)

;; logic to handle loading packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(dolist (package '(use-package flycheck rtags mastodon paradox catppuccin-theme))
  (unless (package-installed-p package)
    (package-install package)))

(use-package paredit :ensure t)
;;(use-package gptel :ensure t :config (setq gptel-api-key (getenv "OPENAI_API_KEY")))


;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'auto-mode-alist '("\\.c\\'" . cc-mode))
;; (add-to-list 'auto-mode-alist '("\\.h\\'" . cc-mode))
;; (add-to-list 'auto-mode-alist '("\\.cpp\\'" . cc-mode))
;; (add-to-list 'auto-mode-alist '("\\.hpp\\'" . cc-mode))
;; (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))


