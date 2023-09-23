;;----------------------------------------------------
;; .emacs file
;;
;; stub file; most of the code loaded from
;; egoodwin-universal.el
;; 06/15/2013
;;---------------------------------------------------

;; create directory tree for .emacs eval
(defconst emacsrootdir "~/emacs/site-lisp/" 
  "root of my site-lisp file")

(add-to-list 'load-path emacsrootdir)
;;(add-to-list 'load-path (format "%s/%s" emacsrootdir "powershell"))
(add-to-list 'custom-theme-load-path (format "%s/%s" emacsrootdir "themes/catppuccin"))

(require 'package) ;; package manager
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)


(require 'egoodwin-packages)
(require 'egoodwin-universal)
(require 'personal-info)

(package-initialize)


;; Python
;; (setq python-shell-interpreter "C:\Python33\python.exe")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode org-journal org-superstar pabbrev org-modern org autothemer)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'catppuccin :no-confirm)


;; (when (not (package-installed-p 'geiser))
