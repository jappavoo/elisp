
;; Put the main theme file almost-mono-themes.el in your load path
(add-to-list 'load-path "~/src/elisp")

;; Put the induvidual theme files almost-mono-{black, white, etc.}-theme.el in your theme load path
(add-to-list 'custom-theme-load-path "~/src/elisp")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(ansi-color-names-vector ["white" "#303030" "#b3b3b3" "#606060"])
 '(custom-enabled-themes '(jappavoo))
 '(custom-safe-themes
   '("47fa1fac54c39b8a78cc449fe7db7f113e647952fdfdc13331a48796d02e4925" "cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2" "bc3cfd8acc553abcc33e980bb564149f6fa5f072cdc04169dd0cc402067ce5d0" "f04dadbec011165cd40a7b8ae6cc0a5cc05cffdc8d69b9d4a921541d0f0b7cea" "ab164adc0f1a26ad8ca6558bbaade87105457ebd0cd58d7f157ae103ad9ed6e6" default))
 '(ispell-dictionary nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-error ((t (:background "white" :foreground "black" :weight ultra-bold))))
 '(compilation-info ((t (:background "white" :foreground "black" :weight bold))))
 '(compilation-mode-line-run ((t (:inherit compilation-warning :background "white" :foreground "black" :weight bold))))
 '(compilation-warning ((t (:inherit warning :background "white" :foreground "black"))))
 '(success ((t (:foreground "black" :weight bold))))
 '(wg-brace-face ((t (:foreground "black"))))
 '(wg-command-face ((t (:foreground "black"))))
 '(wg-divider-face ((t (:foreground "black"))))
 '(wg-filename-face ((t (:foreground "black"))))
 '(wg-message-face ((t (:foreground "black"))))
 '(wg-mode-line-face ((t (:foreground "black"))))
 '(wg-previous-workgroup-face ((t (:foreground "color-238")))))

(define-key global-map (kbd "C-x p") 'previous-multiframe-window)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

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
