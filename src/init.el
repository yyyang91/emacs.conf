(require 'package)
(package-initialize)
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

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
	use-package
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

(use-package org
  :ensure nil
  :config
  (setq org-latex-pdf-process '("tectonic -Z shell-escape %f"))
  (setq org-latex-listings 'minted)
  (add-to-list 'org-latex-packages-alist '("" "minted")
)
)


(add-to-list 'load-path "~/.emacs.d/locale")



(require 'evil)
(evil-mode t)