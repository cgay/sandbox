;; My minimalist .emacs

;; Requires ${DYLAN}

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa-stable" . "https://stable.melpa.org/packages/")
   t)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)
  (add-to-list
   'package-archives
   '("gnu" . "http://elpa.gnu.org/packages/")
   t))


(setq dylan-mode-dir (concat (getenv "DYLAN") "/workspaces/all/dylan-mode"))
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
   ;;["black" "red4" "green4" "yellow4" "blue3" "magenta4" "cyan4" "white"]
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"]
   )
 '(buffers-menu-max-size 30)
 '(buffers-menu-show-directories t)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(debug-on-error t)
 '(dylan-continuation-indent 2)
 '(erc-menu-mode t)
 '(fill-column 79)
 '(indent-tabs-mode nil)
 '(package-selected-packages (quote (deadgrep lsp-mode markdown-mode)))
 '(safe-local-variable-values (quote ((Syntax . Common-Lisp))))
 '(show-paren-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Get rid of the bad background for things like ReStructured Text headers when
;; inside screen and possibly other times. This probably ought to be
;; conditionalized to the display type.
(let ((frame-background-mode 'light)) (frame-set-background-mode nil))

;;; Shell mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; This makes emacs shell notice when my current directory changes.  In
;; particular it works with the dw (dylan workspace) function in my .bashrc.
(add-hook 'shell-mode-hook 'dirtrack-mode)
(setq-default dirtrack-list '(" \\([^ ]+\\) " 1 t)) ; t = multi-line



;;; SLIME / SWANK

(add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-src/slime-2.23")
(require 'slime)
(slime-setup)
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(global-set-key (kbd "C-c l") 'slime-repl)
