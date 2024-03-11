;;; init-terraform.el --- Work with Terraform configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; Terraform

(when (maybe-require-package 'terraform-mode)
  ;; TODO: find/write a replacement for company-terraform
  (with-eval-after-load 'terraform-mode
    ;; I find formatters based on "reformatter" to be more reliable
    ;; so I redefine `terraform-format-on-save-mode' here.
    (when (maybe-require-package 'reformatter)
      (reformatter-define terraform-format
        :program "terraform" :args '("fmt" "-")))))

(add-to-list 'lsp-language-id-configuration '(terraform-mode . "terraform"))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("/usr/bin/terraform-lsp" "-enable-log-file"))
                  :major-modes '(terraform-mode)
                  :server-id 'terraform-ls))

(add-hook 'terraform-mode-hook #'lsp)

(provide 'init-terraform)
;;; init-terraform.el ends here
