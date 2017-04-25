(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))
(eval-when-compile
    (require 'use-package))

; (when (memq window-system '(mac ns x))
;   (exec-path-from-shell-initialize))

; (use-package flycheck
;   :ensure t
;   :init (global-flycheck-mode))

; path
(add-to-list 'exec-path "/usr/local/bin/")

;; page scroll up like vim before call evil
(setq evil-want-C-u-scroll t)

(require 'web-mode)
(require 'doom-themes)
(require 'doom-neotree)
(require 'evil)
(require 'flycheck)
(require 'flycheck-pos-tip)
(require 'neotree)
(require 'all-the-icons)
(require 'projectile)
(require 'helm)
(require 'helm-projectile)
; gruvbox-theme
; php-mode

;; doom-theme brighter minibuffer when active
(add-hook 'minibuffer-setup-hook 'doom-brighten-minibuffer)

;disable backup
(setq backup-inhibited t)

;disable auto save
(setq auto-save-default nil)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(setq web-mode-engines-alist
    '(("php"    . "\\.phtml\\'")
    ("blade"  . "\\.blade\\."))
)

;; php-mode
(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

(add-hook 'after-init-hook #'global-flycheck-mode)

; flycheck
(global-flycheck-mode)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

; psr2
; (setq-local flycheck-phpcs-standard "PSR2")
(setq flycheck-phpcs-standard "PSR2")

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

;; evil-mode
 (evil-mode 1)

;; neotree
;; every time when the neotree window is  opened, it will try to find current
;; file and jump to node.
(setq-default neo-smart-open t)

;; theme
;(setq neo-theme (if window-system 'icons 'nerd)) ; 'classic, 'nerd, 'ascii, 'arrow

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
  ; "B"  'magit-blame-toggle
  "c"  'comment-dwim
  "d"  'kill-this-buffer
  ;"D"  'open-current-line-in-codebase-search
  "f"  'helm-imenu            ;; Jump to function in buffer
  ;"g"  'magit-status
  "h"  'fontify-and-browse    ;; HTML-ize the buffer and browse the result
  "l"  'whitespace-mode       ;; Show invisible characters
  "m"  'helm-mini
  "n"  'neotree-toggle
  ; "nn" 'air-narrow-dwim       ;; Narrow to region and enter normal mode
  ; "nw" 'widen
  ; "o"  'delete-other-windows  ;; C-w o
  "p"  'helm-projectile
  "s"  'ag-project            ;; Ag search from project's root
  "r"  'chrome-reload
  "R"  (lambda () (interactive) (font-lock-fontify-buffer) (redraw-display))
  "S"  'delete-trailing-whitespace
  "t"  'gtags-reindex
  "T"  'gtags-find-tag
  "w"  'save-buffer
  "x"  'helm-M-x
  "y"  'yank-to-x-clipboard)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

;; editor-config
(use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode-edit-element vue-mode editorconfig spaceline-all-the-icons ## use-package-chords flycheck-color-mode-line php+-mode helm-ag helm-projectile helm projectile flycheck-pos-tip flycheck doom-themes fzf dracula-theme all-the-icons neotree evil-leader php-mode gruvbox-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; load path themes
(add-to-list 'load-path "themes")

(load-theme 'thrush t)
;(load-theme 'doom-one t)
 ;(load-theme 'gruvbox t)
; (load-theme 'dracula t)

;; font
(set-frame-font "Fira Code 14")

;; line spacing
(setq-default line-spacing 12)

;; mode line
(use-package anzu
    :ensure t)

(use-package spaceline
    :ensure t
    :init
    (setq powerline-height 20)
    (setq powerline-default-separator "slant")
    :config
    (require 'spaceline-config)
    (spaceline-emacs-theme))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(use-package diminish
    :ensure t
    :config
    (diminish 'auto-revert-mode)
    (diminish 'rainbow-mode))

(setq frame-title-format "%b")

;; only emacs-osx
(mac-auto-operator-composition-mode)
;;;


