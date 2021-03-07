(require 'package)
(package-initialize)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/")))


(require 'cl-lib)

;; Add Packages
(defvar my/packages '(
	evil
	company
	hungry-delete
	treemacs
	swiper
	counsel
	smartparens
	;; --- Major Mode ---
	js2-mode
	;; --- Minor Mode ---
	nodejs-repl
	exec-path-from-shell
	;; --- Themes ---
	monokai-theme
	;; solarized-theme
	) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
	(cl-loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (cl-return nil)
	finally (cl-return t)))

(unless (my/packages-installed-p)
	(message "%s" "Refreshing package database...")
	(package-refresh-contents)
	(dolist (pkg my/packages)
	(when (not (package-installed-p pkg))
	(package-install pkg))))


(global-set-key (kbd "<f2>") 'open-init-file)

(global-linum-mode t)
(global-company-mode t)
(setq cursor-type 'bar)
(setq-default cursor-type 'bar)

(defun open-init-file()
(interactive)
(find-file "~/.emacs.d/init.el"))

;; (setq evil-mode 1)
;; no backup files
(setq make-backup-files nil)