;; My minimalist .emacs

(setq dylan-mode-dir (concat (getenv "DYLAN") "/ws.all/dylan-mode"))
(add-to-list 'load-path dylan-mode-dir)
(load (concat dylan-mode-dir "/dylan-mode.el"))
(add-to-list 'auto-mode-alist '("\\.dylan\\'" . dylan-mode))

;; C-c c to compile
(global-set-key [?\C-c?c] 'compile)

;; C-c s to get a shell
(global-set-key [?\C-c?s] 'shell)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Buffer-menu-name-width 30)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(buffers-menu-max-size 30)
 '(buffers-menu-show-directories t)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(erc-menu-mode t)
 '(show-paren-mode nil)
 '(fill-column 79)
 '(indent-tabs-mode nil)
 '(package-selected-packages (quote (markdown-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(add-hook 'shell-mode-hook 'dirtrack-mode)
(setq-default dirtrack-list '(" \\([^ ]+\\) " 1 t)) ; t = multi-line
