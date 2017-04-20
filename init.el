(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;;; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; disable toolbar
    (tool-bar-mode -1)

;; start at fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; turn beep off
(setq visible-bell nil)

;; hide welcome page
(setq inhibit-startup-screen t)

;; ido mode
(require 'ido)
(ido-mode t)

;; page scroll up like vim
(setq evil-want-C-u-scroll t)

;; evil-mode
 (require 'evil)
 (evil-mode 1)

;; evil-leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  ","  'other-window
  "."  'mode-line-other-buffer
  ":"  'eval-expression
  "aa" 'align-regexp
  "a=" 'my-align-single-equals
  "b"  'helm-mini             ;; Switch to another buffer
  "B"  'magit-blame-toggle
  "c"  'comment-dwim
  "d"  'kill-this-buffer
  "D"  'open-current-line-in-codebase-search
  "f"  'helm-imenu            ;; Jump to function in buffer
  "g"  'magit-status
  "h"  'fontify-and-browse    ;; HTML-ize the buffer and browse the result
  "l"  'whitespace-mode       ;; Show invisible characters
  "n"  'neotree-toggle
  ; "nn" 'air-narrow-dwim       ;; Narrow to region and enter normal mode
  ; "nw" 'widen
  "o"  'delete-other-windows  ;; C-w o
  "p"  'helm-show-kill-ring
  "s"  'ag-project            ;; Ag search from project's root
  "r"  'chrome-reload
  "R"  (lambda () (interactive) (font-lock-fontify-buffer) (redraw-display))
  "S"  'delete-trailing-whitespace
  "t"  'gtags-reindex
  "T"  'gtags-find-tag
  "w"  'save-buffer
  "x"  'helm-M-x
  "y"  'yank-to-x-clipboard)

(require 'neotree)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (neotree evil-leader php-mode gruvbox-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'gruvbox t)

;; font
(set-frame-font "Fira Mono")

;; line spacing
; (setq-default line-spacing 15)
