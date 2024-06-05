;;; Package --- Looks and feel
;;;
;;; Commentary:
;;;
;;; Code:

(require-package 'catppuccin-theme)
(setq catppuccin-flavor 'macchiato)
(load-theme 'catppuccin)
(catppuccin-reload)

(set-face-attribute 'default nil
                    :font "PragmataPro Mono Liga-22:antialias=true:hinting=true:autohint=true")

(provide 'init-looks)
;;; init-looks ends here
