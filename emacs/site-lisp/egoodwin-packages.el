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

(use-package vm
		 nil                        ; download to default directory
		 (nil                       ; use default getter function
		  "http://www.seanet.com/~kylemonger/vm/vm-7.19.tar.gz"
		  ;; after-download form:
		  (shell-command "cd vm-7.19; make"))
		 ;; configuration arg to use-package:
		 ("$COMMON/emacs/email"   ; string means directory for load-path
		  (require 'jcgs-vm-stuff)  ; can add your own aux stuff
		  ([ C-f11 ] . js-vm-get-mail) ; key definitions
		  ([ M-C-f11 ] . vm-continue-composing-message)
		  ;; autoloads/autofetches
		  (vm "vm" "Run the VM mail reader" t)
		  ;; things that look like auto-mode-alist entries are
		  ("~/vm" . vm-mode)
		  ("$COMMON/vm" . vm-mode))
		 ;; remaining args to use-package are eval-after-load forms
		 (setq vm-mutable-frames nil
		       bbdb-completion-type 'primary-or-name
		       read-mail-command 'vm
		       vm-folder-directory (if (file-directory-p
						(expand-file-name "~/vm/"))
					       (expand-file-name "~/vm/")
					     (substitute-in-file-name "$COMMON/vm/"))
		       vm-primary-inbox (expand-file-name "john" vm-folder-directory)))

