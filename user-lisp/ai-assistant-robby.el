;;; lsp-docker.el --- LSP Docker integration         -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;;
;;; Code:

(if (not (package-installed-p 'robby))
    (package-vc-install "https://github.com/stevemolitor/robby.git"))

(setq robby-openai-api-key "sk-ai-assistant-robbie-for-emacs-xBF4NE7RhLC0Rh1sS0XaT3BlbkFJ5n3IQtsGYYLEEYtBy0hg")

;; (optional) bind a prefix key to the robby-command-map, default is "C-c C-r":
(robby-mode)

(global-set-key (kbd "C-S-r") robby-command-map)

;; (optional) show robby view window in a side window on the right side:
(add-to-list 'display-buffer-alist
             '("\\*robby\\*"
               (display-buffer-in-side-window)
               (side . right)
               (window-width . 0.4)))

(provide 'ai-assistant-robby)
;;; ai-assistant-robby.el ends here
