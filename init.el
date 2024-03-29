;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; Org-mode
(add-to-list 'load-path "~/.emacs.d/org/lisp")
(require 'org-install)
(require 'org)
;; remember this directory
(setq starter-kit-dir
      (file-name-directory (or load-file-name (buffer-file-name))))
;;
;; load up the starter kit
(org-babel-load-file (expand-file-name "starter-kit.org" starter-kit-dir))
;;
;;; drcube's customizations
;;  color-theme
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme/")
(require 'color-theme)
(require 'color-theme-autoloads "color-theme-autoloads")
(color-theme-initialize)
(require 'zenburn)
(color-theme-zenburn)
;;  font "Droid Sans Mono"
(set-face-attribute 'default nil :font "Droid Sans Mono-10")
;; enable w3m browser
(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m/")
(require 'w3m-load)
;(require 'mime-w3m)
(require 'w3m-e21)
(provide 'w3m-e23)
(setq w3m-use-cookies t)
;; visible bell
(setq visible-bell t)
;; allow selection deletion
(delete-selection-mode t)
;; make sure delete key is delete key
(global-set-key [delete] 'delete-char)
;; have emacs scroll line-by-line
(setq scroll-step 1)
;; keep backup files neatly out of the way in .~/
(setq backup-directory-alist '(("." . ".~")))
;; get rid of that crap at the beginning
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
;; disable the menu bar
(menu-bar-mode -1)
;; disable the scrollbar
(toggle-scroll-bar -1)
;; disable the toolbar
(tool-bar-mode -1) 
;; line numbers on the left
(global-linum-mode t)
;;; Recent Files
(require 'recentf)
(recentf-mode 1)     ;; Enable
(setq recentf-max-menu-items 25) ;; how many to remember
(global-set-key "\C-x\ \C-r" 'recentf-open-files) ;; bind to C-x C-r 
;;; Helpful at work on Cygwin, must alter at home:
;;; SLIME Lisp interpreter for Emacs
;(add-to-list 'load-path "/home/joshbari/bin/slime") ; path where slime was unzipped
;(setq inferior-lisp-program "/usr/bin/clisp.exe") ; current lisp system
;(require 'slime)
;(slime-setup)
;;; Printing
;(setenv "PRINTER" "PDFCreator")
;(cond ((eq system-type 'windows-nt)
;       (setq ps-printer-name "PDFCreator")y
;       (setq ps-printer-name-option "-d")
;       (setq ps-lpr-command "/bin/lpr.exe")
;))
;;
;;; init.el ends here
