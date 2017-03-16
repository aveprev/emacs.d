(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)

;; M-x ns-popup-font-panel
;; M-x describe-font
(set-default-font "-*-Roboto Mono for Powerline-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")

(desktop-save-mode t)
(setq ns-pop-up-frames nil)
(setq echo-keystrokes 0.1)
(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(show-paren-mode t)

(setq linum-format "%4d ")
(add-hook 'find-file-hook 'linum-mode)

(require 'tramp)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(require 'powerline)
(require 'moe-theme)

(setq moe-theme-highlight-buffer-id t)

(powerline-moe-theme)
(moe-theme-set-color 'green)
(moe-dark)

(ido-mode 1)
(ido-everywhere 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)
