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
	;; window-numbering
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
	lsp-mode
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
(global-set-key (kbd "<f3>") 'treemacs)

(global-linum-mode t)
(global-company-mode t)
(setq cursor-type 'bar)
(setq-default cursor-type 'bar)

(defun open-init-file()
(interactive)
(find-file "~/.emacs.d/init.el"))

(setq evil-mode 1)
;; no backup files
(setq make-backup-files nil)

(add-to-list 'load-path "~/.emacs.d/locale")

(require 'window-numbering)
(defun window-numbering-get-number-string (&optional window)
  (let ((s (int-to-string (window-numbering-get-number window))))
    (propertize (concat " " s " ") 'face 'window-numbering-face)))
(window-numbering-mode 1)

(require 'evil)
(evil-mode t)