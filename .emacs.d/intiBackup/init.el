;; -*- lexical-binding: t -*-

;; make PC keyboard's Win key or other to type Super or Hyper, for emacs running on Windows.
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key

(setq w32-pass-rwindow-to-system nil)
(setq w32-rwindow-modifier 'super) ; Right Windows key

(setq w32-pass-apps-to-system nil)
(setq w32-apps-modifier 'hyper) ; Menu/App key

;; Org mode preferences

(setq org-hide-emphasis-markers t)

;; Package managers

(require 'package)
(add-to-list 'package-archives
    '(("marmalade" . "http://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.org/packages/")))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Add default directories

(add-to-list 'load-path "~/.emacs.d/user/")

;; Requires

(package-initialize)
(require 'evil)
(evil-mode 1)
(require 'key-chord)
(key-chord-mode 1)
(load-library "evil-key-init")

;; Keybindings global

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; Options/Keybindings Org

(setq org-hide-leading-stars t)

(add-hook 'org-mode-hook
          (lambda ()
	    (setq visual-line-mode t)
	    ))

;; emacs auto config

(put 'scroll-left 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "F:/Dropbox/org/org.org")
 '(org-agenda-files
   (quote
    ("f:/Dropbox/org/linux.org" "f:/Dropbox/org/emacs.org" "f:/Dropbox/org/org.org" "f:/Dropbox/org/infosec.org")))
 '(tool-bar-mode nil)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(outline-1 ((t (:inherit font-lock-function-name-face :foreground "aquamarine")))))
