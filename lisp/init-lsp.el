;;; init-lsp.el --- LSP support via lsp-mode          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(maybe-require-package 'flycheck)
(maybe-require-package 'company-mode)
(maybe-require-package 'lsp-ui)
(maybe-require-package 'lsp-treemacs)
(maybe-require-package 'helm-lsp)
(maybe-require-package 'lsp-ivy)
(maybe-require-package 'dap-mode)
(global-flycheck-mode)
(global-company-mode)
(dap-mode)

;; if you want to change prefix for lsp-mode keybindings.
(setq lsp-keymap-prefix "C-l")
(define-key global-map (kbd "C-c C-s") 'lsp-keymap-prefix)

;; default is 0.2
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)

(setq lsp-modeline-diagnostics-enable t)

(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  (setq lsp-modeline-diagnostics-scope :workspace))

;; lsp-headerline-breadcrumb-enable-symbol-numbers
(setq lsp-modeline-code-actions-segments '(count icon name))

(setq lsp-clients-angular-language-server-command
      '("node"
        "/usr/lib/node_modules/@angular/language-server"
        "--ngProbeLocations"
        "/usr/lib/node_modules"
        "--tsProbeLocations"
        "/usr/lib/node_modules"
        "--stdio"))

(provide 'init-lsp)
;;; init-lsp.el ends here
