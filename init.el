(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

; (use-package flycheck
;   :ensure t
;   :init (global-flycheck-mode))

(require 'doom-themes)
(require 'doom-neotree)
(require 'evil)
(require 'neotree)
(require 'all-the-icons)
(require 'ido)
; gruvbox-theme
; php-mode
(ido-mode t)

; flycheck
(global-flycheck-mode)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;; php-mode
(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

;; highlight current line
(global-hl-line-mode 1)

;;; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; disable menubar, toolbar and scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; start at fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; turn beep off
(setq visible-bell nil)

;; hide welcome page
(setq inhibit-startup-screen t)


;; page scroll up like vim
(setq evil-want-C-u-scroll t)

;; evil-mode
 (evil-mode 1)

;; neotree
;; every time when the neotree window is  opened, it will try to find current
;; file and jump to node.
(setq-default neo-smart-open t)

;; theme
(setq neo-theme (if window-system 'icons 'nerd)) ; 'classic, 'nerd, 'ascii, 'arrow

;; neotree with evil
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-enter)

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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-pos-tip flycheck doom-themes fzf dracula-theme all-the-icons neotree evil-leader php-mode gruvbox-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'doom-one t)
; (load-theme 'gruvbox t)
; (load-theme 'dracula t)

;; font
(set-frame-font "Fira Mono 14")

;; line spacing
(setq-default line-spacing 12)
