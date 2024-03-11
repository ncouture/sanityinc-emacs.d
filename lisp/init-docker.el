;;; init-docker.el --- Work with Docker and its tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'docker)
  (sanityinc/fullframe-mode 'docker-image-mode)
  (sanityinc/fullframe-mode 'docker-machine-mode)
  (sanityinc/fullframe-mode 'docker-volume-mode)
  (sanityinc/fullframe-mode 'docker-network-mode)
  (sanityinc/fullframe-mode 'docker-container-mode))
(maybe-require-package 'dockerfile-mode)
(maybe-require-package 'docker-compose-mode)
(maybe-require-package 'lsp-docker)

(defvar lsp-docker-client-packages
    '(lsp-css lsp-clients lsp-bash lsp-go lsp-pylsp lsp-html lsp-typescript
      lsp-terraform lsp-clangd))

(setq lsp-docker-client-configs
    '((:server-id bash-ls :docker-server-id bashls-docker :server-command "bash-language-server start")
      (:server-id clangd :docker-server-id clangd-docker :server-command "clangd")
      (:server-id css-ls :docker-server-id cssls-docker :server-command "css-languageserver --stdio")
      (:server-id dockerfile-ls :docker-server-id dockerfilels-docker :server-command "docker-langserver --stdio")
      (:server-id gopls :docker-server-id gopls-docker :server-command "gopls")
      (:server-id html-ls :docker-server-id htmls-docker :server-command "html-languageserver --stdio")
      (:server-id pylsp :docker-server-id pyls-docker :server-command "pylsp")
      (:server-id ts-ls :docker-server-id tsls-docker :server-command "typescript-language-server --stdio")))

(require 'lsp-docker)
(lsp-docker-init-clients
  :path-mappings '(("/home/strmvlt/" . "/git"))
  :client-packages lsp-docker-client-packages
  :client-configs lsp-docker-client-configs)

;; (add-hook 'dap-stopped-hook
;;           (lambda (arg) (call-interactively #'dap-hydra)))


(provide 'init-docker)
;;; init-docker.el ends here
