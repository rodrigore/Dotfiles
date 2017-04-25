;;; thrush-theme.el --- Custom face theme for Emacs
;;; Commentary:
;;; Author: Nathan Hunzaker
;;; URL: https://github.com/nhunzaker/thrush-emacs
;;; Version: 0.0.1

;;; Code:
(deftheme thrush "Deep forest theme")

(let ((base00 (if window-system "#22202a" 'unspecified))
      (base01 "#E9F2CE")
      (base02 "#963a46")
      (base03 "#E5892E")
      (base04 "#708C54") ;; (base04 "#93C763")
      (base05 "#4C7499")
      (base06 "#D96C57")
      (base07 "#F2BA49")
      (base08 "#4C5159")
      (base09 "#262B17"))

  (let ((background-color base00)
        (region-color base08)
        (focus-color base01)
        (constant-face base06)
        (comment-color base08)
        (doc-tag-color base05)
        (atom-color base06)
        (highlight-color base07)
        (text-color base01)
        (builtin-face base04)
        (error-color base02)
        (link-color base04)
        (string-face base03)
        (type-face base05)
        (param-color base07)
        (variable-color base01)
        (function-color base01)
        (keyword-face base04)
        (warning-color base03)
        (error-color base03))

    (custom-theme-set-faces
     'thrush

     ;; Basics
     `(cursor ((t (:background ,text-color, :foreground unspecified))))
     `(default ((t (:background ,background-color :foreground ,text-color :weight light ))))
     `(isearch ((t (:background ,highlight-color :foreground ,background-color ))))
     `(isearch-fail ((t (:background unspecified :foreground ,error-color))))
     `(match ((t (:background ,focus-color :foreground unspecified))))
     `(menu ((t (:background ,text-color :foreground ,background-color))))
     `(region ((t (:background ,region-color :foreground unspecified))))
     `(warning ((t (:foreground ,warning-color))))

     `(button ((t (:foreground ,link-color :underline t))))
     `(link ((t (:underline t))))
     `(link-visited ((t (:underline t))))

     `(hl-line ((t :background unspecified, :foreground unspecified)))
     `(highlight ((t (:background unspecified :foreground ,highlight-color, :underline t))))
     `(lazy-highlight ((t (:background unspecified :foreground ,text-color))))
     `(mouse-face ((t (:background ,background-color :foreground ,highlight-color))))
     `(match ((t (:background ,base00))))

     ;; The Border around the edge of the frame
     `(fringe ((t (:background unspecified :forground "#333"))))
     `(vertical-border ((t (:background unspecified :foreground "#292938"))))
     `(linum ((t (:background "#292938" :foreground "#595965" :height 120 :slant normal :underline nil))))

     `(font-lock-builtin-face ((t (:foreground ,builtin-face :weight normal))))
     `(font-lock-comment-face ((t (:slant italic :foreground ,comment-color))))
     `(font-lock-constant-face ((t (:foreground ,constant-face))))
     `(font-lock-doc-face ((t (:foreground ,comment-color :slant italic))))
     `(font-lock-error-face ((t (:background ,error-color :foreground ,background-color :weight normal))))
     `(font-lock-function-name-face ((t (:foreground ,function-color))))
     `(font-lock-keyword-face ((t (:foreground ,keyword-face))))
     `(font-lock-preprocessor-face ((t (:foreground ,focus-color ))))
     `(font-lock-string-face ((t (:foreground ,string-face :weight regular ))))
     `(font-lock-type-face ((t (:foreground ,type-face))))
     `(font-lock-variable-name-face ((t (:foreground ,variable-color))))
     `(font-lock-warning-face ((t (:inherit 'warning))))

     ;; NeoTree
     ;;;;;;;;;
     `(neo-button-face ((t (:foreground ,link-color))))
     `(neo-header-face ((t (:foreground ,comment-color))))

     ;; Interactively do things
     `(ido-first-match ((t (:foreground ,focus-color))))
     `(ido-subdir ((t (:foreground ,focus-color))))
     `(ido-indicator ((t (:background ,error-color :foreground ,highlight-color))))
     `(ido-only-match ((t (:foreground ,string-face))))

     ;; Menus
     `(info-index-match ((t (:background ,text-color :foreground ,background-color))))
     `(info-menu-star ((t (:foreground ,error-color))))

     ;; When finding files, this highlights matching
     `(flx-highlight-face ((t (:foreground ,link-color :background unspecified))))

     ;; Makefile
     `(makefile-targets ((t (:foreground ,builtin-face))))

     ;; Errors
     ;;;;;;;;;
     `(flymake-errline  ((t (:inherit 'font-lock-error-face))))
     `(flymake-warnline ((t (:inherit font-lock-warning-face))))
     `(flycheck-error ((t (:underline (:color ,error-color :style wave) :bold t))))
     `(flycheck-fringe-error ((t (:foreground ,error-color :bold t))))
     `(flyspell-incorrect ((t (:background unspecified :underline (:color ,error-color :style wave) :foreground unspecified))))
     `(flyspell-duplicate ((t (:background: unspecified :foreground unspecified :underline (:color ,string-face :style wave)))))
     `(flycheck-fringe-warning ((t (:foreground ,warning-color :bold t))))


     ;; white-space mode
     ;;;;;;;;;;;;;;;;;;;;;
     `(whitespace-tab ((t (:background nil :foreground ,background-color, :underline t))))
     `(whitespace-indentation ((t (:background nil :foreground ,background-color ))))
     `(whitespace-empty ((t (:background unspecified :foreground unspecified :underline t))))
     `(trailing-whitespace ((t (:background ,error-color :foreground ,background-color))))
     `(whitespace-trailing ((t (:background ,error-color :foreground ,background-color))))
     `(whitespace-line ((t (:background unspecified :foreground unspecified :underline t))))

     ;; YAML ;;
     ;;;;;;;;;
     `(yaml-tab-face ((t (:background ,error-color :foreground ,background-color))))

     ;; CSS Mode ;;
     ;;;;;;;;;;;;;
     `(css-selector ((t (:foreground ,string-face ))))
     `(css-property ((t (:foreground ,builtin-face ))))
     `(css-proprietary-property ((t (:foreground ,text-color :italic t))))
     `(scss-variable-color ((t (:foreground ,type-face))))
     `(scss-keyword-face ((t (:foreground ,keyword-face ))))

     ;; Markdown Mode ;;
     ;;;;;;;;;;;;;;;;;;
     `(markdown-header-face   ((t (:foreground ,base04))))
     `(markdown-header-face-1 ((t (:foreground ,base03))))
     `(markdown-header-face-2 ((t (:foreground ,base03))))
     `(markdown-header-face-3 ((t (:foreground ,base03))))
     `(markdown-header-face-4 ((t (:foreground ,base03))))
     `(markdown-header-face-5 ((t (:foreground ,base03))))
     `(markdown-header-face-6 ((t (:foreground ,base03))))
     `(markdown-bold-face  ((t (:foreground ,base03 :bold t))))
     `(markdown-blockquote-face  ((t (:foreground,comment-color :italic t))))
     `(markdown-pre-face  ((t (:foreground ,base04))))

     ;; ERC Mode ;;
     ;;;;;;;;;;;;;
     `(bg:erc-color-face0 ((t :background ,base01 :foreground ,background-color)))
     `(bg:erc-color-face1 ((t :background ,base00 :foreground ,text-color)))
     `(bg:erc-color-face3 ((t :background ,base01 :foreground ,background-color)))
     `(bg:erc-color-face4 ((t :background ,base02 :foreground ,background-color)))
     `(bg:erc-color-face5 ((t :background ,base03 :foreground ,background-color)))
     `(bg:erc-color-face6 ((t :background ,keyword-face :foreground ,background-color)))
     `(bg:erc-color-face7 ((t :background ,base03 :foreground ,background-color)))
     `(bg:erc-color-face8 ((t :background ,highlight-color :foreground ,background-color)))
     `(bg:erc-color-face9 ((t :background ,string-face :foreground ,background-color)))
     `(bg:erc-color-face10 ((t :background ,base01 :foreground ,text-color)))
     `(bg:erc-color-face11 ((t :background ,link-color :foreground ,background-color)))
     `(bg:erc-color-face12 ((t :background ,constant-face :foreground ,background-color)))
     `(bg:erc-color-face13 ((t :background ,keyword-face :foreground ,background-color)))
     `(bg:erc-color-face14 ((t :background ,focus-color :foreground ,text-color)))
     `(bg:erc-color-face15 ((t :background ,base01 :foreground ,background-color)))

     `(fg:erc-color-face0 ((t :foreground ,text-color)))
     `(fg:erc-color-face1 ((t :foreground ,base00)))
     `(fg:erc-color-face2 ((t :foreground ,constant-face)))
     `(fg:erc-color-face3 ((t :foreground ,string-face)))
     `(fg:erc-color-face4 ((t :foreground ,base02)))
     `(fg:erc-color-face5 ((t :foreground ,comment-color)))
     `(fg:erc-color-face6 ((t :foreground ,keyword-face)))
     `(fg:erc-color-face7 ((t :foreground ,base03)))
     `(fg:erc-color-face8 ((t :foreground ,highlight-color)))
     `(fg:erc-color-face9 ((t :foreground ,string-face)))
     `(fg:erc-color-face10 ((t :foreground ,text-color)))
     `(fg:erc-color-face11 ((t :foreground ,link-color)))
     `(fg:erc-color-face12 ((t :foreground ,constant-face)))
     `(fg:erc-color-face13 ((t :foreground ,base03)))
     `(fg:erc-color-face14 ((t :foreground ,text-color)))
     `(fg:erc-color-face15 ((t :foreground ,text-color)))

     `(erc-nick-msg-face ((t (:foreground ,base01))))
     `(erc-current-nick-face ((t (:foreground ,base03))))
     `(erc-direct-msg-face ((t (:foreground ,focus-color))))
     `(erc-default-face ((t (:foreground ,text-color))))
     `(erc-fool-face ((t (:foreground ,constant-face))))
     `(erc-command-indicator-face ((t (:foreground ,base03))))
     `(erc-notice-face ((t (:foreground ,comment-color))))
     `(erc-button ((t (:foreground ,link-color))))
     `(erc-prompt-face ((t (:foreground ,focus-color))))
     `(erc-dangerous-host-face ((t (:background ,error-color :foreground ,background-color :weight bold))))
     `(erc-error-face ((t (:foreground ,error-color :weight bold))))
     `(erc-inverse-face ((t (:background unspecified :foreground unspecified :weight bold))))
     `(erc-input-face ((t (:background unspecified :foreground ,text-color :weight bold))))
     `(erc-keyword-face ((t (:background unspecified :foreground ,string-face :weight bold))))
     `(erc-pal-face ((t (:background unspecified :foreground ,base03 :weight bold))))
     `(erc-timestamp-face ((t (:background unspecified :foreground ,string-face :weight bold))))
     `(erc-nick-default-face ((t (:foreground ,string-face :weight bold))))
     `(show-paren-match ((t (:background unspecified :foreground ,highlight-color :underline nil :weight bold))))
     `(show-paren-mismatch ((t (:background unspecified :foreground ,highlight-color :underline nil :weight bold))))

     ;; Web Mode ;;
     ;;;;;;;;;;;;;;
     `(web-mode-block-face ((t (:foreground ,text-color, :background unspecified ))))
     `(web-mode-block-delimiter-face ((t (:foreground ,base03, :background unspecified ))))
     `(web-mode-block-control-face ((t (:foreground ,base03, :background unspecified ))))
     `(web-mode-builtin-face ((t (:inherit font-lock-builtin-face))))
     `(web-mode-constant-face ((t (:inherit font-lock-constant-face))))
     `(web-mode-current-element-highlight-face ((t (:foreground ,base03 :background nil))))
     `(web-mode-folded-face ((t (:foreground unspecified :underline t))))
     `(web-mode-html-attr-equal-face ((t (:foreground ,comment-color ))))
     `(web-mode-html-attr-name-face ((t (:foreground ,comment-color ))))
     `(web-mode-html-attr-value-face ((t :inherit font-lock-string-face)))
     `(web-mode-html-tag-bracket-face ((t (:foreground ,comment-color))))
     `(web-mode-html-tag-face ((t (:foreground ,builtin-face ))))
     `(web-mode-keyword-face ((t (:inherit font-lock-keyword-face))))
     `(web-mode-preprocessor-face ((t (:inherit font-lock-preprocessor-face ))))
     `(web-mode-symbol-face ((t (:foreground ,base05 ))))
     `(web-mode-type-face ((t (:inherit font-lock-type-face ))))
     `(web-mode-variable-name-face ((t (:inherit font-lock-variable-color ))))
     `(web-mode-whitespace-face ((t (:foreground ,error-color :background: ,error-color))))
     `(web-mode-css-selector-face ((t :foreground ,base06 )))
     `(web-mode-css-property-name-face ((t :foreground ,builtin-face )))
     `(web-mode-css-variable-color ((t :inherit font-lock-variable-name-face )))
     `(web-mode-css-at-rule-face ((t :inherit font-lock-keyword-face )))
     `(web-mode-css-function-face ((t :inerit font-lock-variable-name-face )))

     `(js2-external-variable ((t :foreground ,base03)))
     `(js2-warning ((t (:foreground unspecified :background unspecified :underline (:color ,highlight-color :style wave)))))
     `(js2-error ((t (:foreground unspecified :background unspecified :underline (:color "#402", :style wave)))))
     `(js2-function-param ((t (:foreground ,param-color))))

     `(js2-error ((t (:underline (:color ,warning-color :style wave )))))
     `(js2-function-call ((t :foreground ,text-color)))
     `(js2-jsdoc-tag ((t (:foreground ,doc-tag-color :italic t))))
     `(js2-jsdoc-type ((t (:foreground ,doc-tag-color :italic t))))
     `(js2-jsdoc-value ((t (:foreground ,doc-tag-color :italic t))))

     ;; multi-mark mode
     `(mc/master-face ((t (:inherit 'lazy-highlight))))
     `(mc/region-face ((t (:background ,highlight-color :foreground ,background-color))))

     ;; magit
     `(magit-blame-date ((t (:foreground ,text-color))))
     `(magit-blame-hash ((t (:foreground ,text-color))))
     `(magit-blame-heading ((t (:foreground ,text-color))))
     `(magit-blame-name ((t (:foreground ,text-color))))
     `(magit-blame-summary ((t (:foreground ,text-color))))

     ;;misc
     `(ffap ((t (background: unspecified))))

     ;; org
     `(org-document-title ((t (:foreground ,base01))))
     `(org-todo ((t (:foreground ,base06))))
     `(org-done ((t (:foreground ,base04))))

     `(minibuffer-prompt ((t (:background ,background-color :foreground ,base01 :height 120))))

     `(mode-line-highlight ((t (:background ,highlight-color))))
     `(mode-line-buffer-id ((t (:background unspecified :foreground unspecified))))

     `(mode-line ((t (:background ,base09 :foreground ,text-color :height 100))))
     `(mode-line-inactive ((t (:background ,background-color :foreground ,comment-color :height 100))))

     `(org-mode-line-clock ((t (:background unspecified :foreground ,base01))))
     `(org-pomodoro-mode-line ((t (:background unspecified :foreground ,highlight-color))))

     ;; Elixir Mode
     `(elixir-attribute-face ((t (:foreground ,doc-tag-color))))
     `(elixir-atom-face ((t (:foreground ,atom-color))))
     )))

;;;###autoload
(when load-file-name
  (add-to-list `custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'thrush)

;;; thrush-theme.el ends here

