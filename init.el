(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(desktop-save-mode t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package magit
  :ensure t)
(use-package powerline
  :ensure t)
;;(use-package moe-theme
;;  :ensure t)
(use-package nimbus-theme)

(use-package ido-completing-read+
  :ensure t)
(use-package diff-hl
  :ensure t)
(use-package ensime
             :ensure t
             :pin melpa-stable)

;; M-x ns-popup-font-panel
;; M-x describe-font
(if (eq system-type 'darwin)
    (set-default-font "-*-Roboto Mono for Powerline-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))

(setq
 ns-pop-up-frames nil
 echo-keystrokes 0.1
 create-lockfiles nil
 make-backup-files nil)
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)
(show-paren-mode t)

(setq linum-format "%4d ")
(add-hook 'find-file-hook 'linum-mode)

(require 'tramp)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

;;(require 'powerline)
;;(require 'moe-theme)

(setq moe-theme-highlight-buffer-id t)

;;(powerline-moe-theme)
;;(moe-theme-set-color 'green)
;;(moe-dark)

(ido-mode 1)
(ido-everywhere 1)
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(global-diff-hl-mode t)
(diff-hl-flydiff-mode t)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)


(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))


(setenv "DICTIONARY" "en_US")
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq ispell-program-name "hunspell")

(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
