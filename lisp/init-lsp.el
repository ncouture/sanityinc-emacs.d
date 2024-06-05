;;; init-lsp.el --- LSP support via lsp-mode          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(maybe-require-package 'lsp-ui)
(maybe-require-package 'lsp-treemacs)
(maybe-require-package 'helm-lsp)
(maybe-require-package 'lsp-ivy)
(maybe-require-package 'dap-mode)

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

;;(package-initialize)
(setq lsp-enable-suggest-server-download nil)

(unless package-archive-contents
  (package-refresh-contents))

(package-install-selected-packages)

;; lsp configuration begin
(with-eval-after-load 'lsp-mode
  (require 'yasnippet))

(add-hook 'prog-mode-hook 'lsp-deferred)

(setq lsp-log-io t)
(setq-default lsp-ui-sideline-show-hover t)
(require 'lsp-go)
(require 'lsp-html)
;; lsp configuration end

(provide 'init-lsp)
;;; init-lsp.el ends here
