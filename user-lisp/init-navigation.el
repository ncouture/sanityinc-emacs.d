;;; package --- Navigation
;;;
;;; Commentary:
;;;
;;; Code:

(require-package 'flycheck)
(require-package 'company-mode)
(require-package 'dap-mode)
(require-package 'yasnippet)
(require-package 'ivy-mode)
(ivy-mode)
(yas-global-mode)
(ido-mode)
(global-flycheck-mode)
(global-company-mode)
(dap-mode)
(treemacs)

(add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))

(provide 'init-navigation)
;;; init-navigation ends here
