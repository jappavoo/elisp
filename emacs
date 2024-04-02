
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
 '(custom-enabled-themes '(monochrome-bright))
 '(custom-safe-themes
   '("7bb50123ea3e047d1d62e91f35734c7d8dcb890f899bfdc0c6e0819812f42c9e" "25bc226a8f98ebca97d46cce912bdc3d69ec44a30b5f1fb40cf21c4ac6b4498f" "4d21e730b37406fd4dc319edefc011e8e020fd8efd631ad3903925cef5e373f9" "ccedd7ac5b3126f05112ed26334e993c173781386f077c0981908adf5823c61f" "ffb16d0764a5de5fc4b7454587649d3d41d90d0ceaf6febc6862c13c730a8187" "7643c467081186a0fe661ad3c17a1750e38f97068903f820c3822777074a7afd" "28565940ba1ada83eebac714a3f4f8593fdba671e62d2455cf020e086b8eff4a" "6664196b57fc6cc226809fc3d7d7f0d20095794fed8f5eef71a3b8a41bfbefef" "5c2ba136b81f9f2d88cc21b85a67fd7e0a634b0de1811843a6cba474108dd3e0" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" default))
 '(ispell-dictionary nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-error ((t (:background "white" :foreground "black" :weight ultra-bold))))
 '(compilation-info ((t (:background "white" :foreground "black" :weight bold))))
 '(compilation-mode-line-run ((t (:inherit compilation-warning :background "white" :foreground "black" :weight bold))))
 '(compilation-warning ((t (:inherit warning :background "white" :foreground "black")))))

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
