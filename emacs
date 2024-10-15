
;; Put the main theme file almost-mono-themes.el in your load path
(add-to-list 'load-path "~/src/elisp")

;; Put the induvidual theme files almost-mono-{black, white, etc.}-theme.el in your theme load path
(add-to-list 'custom-theme-load-path "~/src/elisp")


(require 'package)
(add-to-list 'package-archives '("melpa", "http://melpa.org/packages"))
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(unless (package-installed-p 'use-package)
	(package-install 'use-package))
(require 'use-package)	

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(jappavoo))
 '(custom-safe-themes
   '("2214a42e8b447e8b927302e19f9dd916f4272f4819857872d78d803f04d6968a" "934a7a44277c7dbc5cc552d18646de91067af33ad9257e100a66c5bb31dc7dd2" "47fa1fac54c39b8a78cc449fe7db7f113e647952fdfdc13331a48796d02e4925" "cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2" "bc3cfd8acc553abcc33e980bb564149f6fa5f072cdc04169dd0cc402067ce5d0" "f04dadbec011165cd40a7b8ae6cc0a5cc05cffdc8d69b9d4a921541d0f0b7cea" "ab164adc0f1a26ad8ca6558bbaade87105457ebd0cd58d7f157ae103ad9ed6e6" default))
 '(ispell-dictionary nil)
 '(package-selected-packages '(auctex auxtex use-package lsp-grammarly flycheck)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-error ((t (:background "white" :foreground "black" :weight ultra-bold))))
 '(compilation-info ((t (:background "white" :foreground "black" :weight bold))))
 '(compilation-mode-line-run ((t (:inherit compilation-warning :background "white" :foreground "black" :weight bold))))
 '(compilation-warning ((t (:inherit warning :background "white" :foreground "black"))))
 '(custom-variable-obsolete ((t (:foreground "black"))))
 '(font-lock-variable-name-face ((t (:foreground "black" :weight bold))))
 '(match ((t (:underline t :slant italic :weight bold))))
 '(sh-heredoc ((t (:foreground "black" :slant oblique))))
 '(sh-quoted-exec ((t (:foreground "black" :slant italic :weight bold))))
 '(success ((t (:foreground "black" :weight bold))))
 '(tty-menu-disabled-face ((t (:foreground "gray"))))
 '(tty-menu-enabled-face ((t (:foreground "black" :weight bold))))
 '(tty-menu-selected-face ((t (:background "black" :foreground "white"))))
 '(wg-brace-face ((t (:foreground "black"))))
 '(wg-command-face ((t (:foreground "black"))))
 '(wg-current-workgroup-face ((t (:foreground "black" :underline t :weight bold))))
 '(wg-divider-face ((t (:foreground "black"))))
 '(wg-filename-face ((t (:foreground "black"))))
 '(wg-message-face ((t (:foreground "black"))))
 '(wg-mode-line-face ((t (:foreground "black"))))
 '(wg-previous-workgroup-face ((t (:foreground "color-238")))))

;; From https://www.kernel.org/doc/html/v4.10/process/coding-style.html
;; https://www.kernel.org/doc/html/v4.10/process/coding-style.html#you-ve-made-a-mess-of-it
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/src/linux-trees")
                                       filename))
                (setq indent-tabs-mode t)
                (setq show-trailing-whitespace t)
                (c-set-style "linux-tabs-only")))))


(define-key global-map (kbd "C-x p") 'previous-multiframe-window)
(global-set-key (kbd "C-c <RET>") 'hs-toggle-hiding)
(global-set-key (kbd "C-c h") 'hs-hide-all)
(global-set-key (kbd "C-c s") 'hs-show-all)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)

(setq fci-rule-column 80)
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda ()
    (if (and
         (not (string-match "^\*.*\*$" (buffer-name)))
         (not (eq major-mode 'dired-mode)))
        (fci-mode 1))))

(global-fci-mode 1)

(desktop-save-mode 1)
(shell "*shell*")
(shell "*shell*<2>")
(shell "*shell*<3>")
(shell "*shell*<4>")
(shell "*shell*<5>")
(get-buffer-create "*compilation*")

(require 'workgroups)
(workgroups-mode 1)
(wg-load "~/.emacs.d/workgroups")
(setq wg-morph-hsteps (* 4 wg-morph-hsteps))
(setq wg-morph-vsteps (* 6 wg-morph-vsteps))
(setq wg-morph-terminal-hsteps wg-morph-hsteps)
(setq wg-morph-terminal-vsteps wg-morph-vsteps)

(require 'undo-tree)
(global-undo-tree-mode)

(use-package auctex
	     :ensure t)
(require 'auctex)	     

(server-start)
