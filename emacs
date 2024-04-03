
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
 '(ansi-color-names-vector ["white" "#303030" "#b3b3b3" "#606060"])
 '(custom-enabled-themes '(monotropic))
 '(custom-safe-themes
   '("7788f5b3df83343d127fc9dc0ac8cfb0816293899daffcf62b62993ed282a251" "9a485c1e542e1ed2ce2e327476de5482b1dd4480f72188d7ce83de159a4740f7" "6bd32475c65992a31b710551618b736cf7208076fc435584894aed0d883b4a1f" "5453603794f8b008891ecd08504d98b31dc4c46272b88c4f8e4319d5b7b3e045" "75185b2b5208cca132fee8b2d690f4c2a6cb21b12f58e7a9a9fc05c3bb00bb60" "72286569e9747852b5af5dc012da1250b4576918733d762dbaad64fda1e0aa36" "df628f28074da8fc6b2f2831bb029ee7b4b7ead3828fc2e79a6a9dac51e3290b" "f8a5b634ad078410f14b4dd249ade131d704da3641bcc154c49e81371e57d124" "c79887c3a5eca7e4f5dac955163557e4235fc0ffe10ea8bd833f733eecee9f76" "05be00989a9d236a0913e45b7c9655f1bd4554b36b61f556463eefa202530c93" "c757f0cbf5c7724bed5dc19e7a7718c6a28168077089c8352802b27dcad61284" "329fcf244e32b2798c96e85858af385192a62b070849dd4aba177938fdde808b" "2096fc1d1b7cbb8418b0900729f634bb6c5010d1b0e564a0d158f5aa50972139" "065899ce1f5cb9f93c09ddaf13d1d90b73e1366b6ffc9d5c689e809f40a6c562" "e9d1dc2b44eae1a14b560f13a7a3b1c48c2aeba2b7a9786c4d53001fe03ce3f8" "1c5cac618c00e30b8cba826661fc4e724f3833c7387d878e8578b2e1ca8dadc7" "ebed378c71eff3c46e7e0840b955088f29cc1160e793917901f574a591308f28" "35c01c2b6120c0441b38a71cb90d61e75f8d09f4058a527d83419f9630b888c5" "a1b21c4d7f9f82c600967cf349f0481c3db89842e28abd91b55f4899e5b3a3ce" "7bb50123ea3e047d1d62e91f35734c7d8dcb890f899bfdc0c6e0819812f42c9e" "25bc226a8f98ebca97d46cce912bdc3d69ec44a30b5f1fb40cf21c4ac6b4498f" "4d21e730b37406fd4dc319edefc011e8e020fd8efd631ad3903925cef5e373f9" "ccedd7ac5b3126f05112ed26334e993c173781386f077c0981908adf5823c61f" "ffb16d0764a5de5fc4b7454587649d3d41d90d0ceaf6febc6862c13c730a8187" "7643c467081186a0fe661ad3c17a1750e38f97068903f820c3822777074a7afd" "28565940ba1ada83eebac714a3f4f8593fdba671e62d2455cf020e086b8eff4a" "6664196b57fc6cc226809fc3d7d7f0d20095794fed8f5eef71a3b8a41bfbefef" "5c2ba136b81f9f2d88cc21b85a67fd7e0a634b0de1811843a6cba474108dd3e0" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" default))
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
