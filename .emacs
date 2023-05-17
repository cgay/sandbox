;; Use f7 to generate the Super key on tty emacs.
(global-set-key [f7] nil)
(global-set-key [f8] nil)
(define-key function-key-map [(f7)] 'event-apply-super-modifier)
(define-key function-key-map [(f8)] 'event-apply-hyper-modifier)

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
 '(custom-enabled-themes '(wombat))
 '(debug-on-error t)
 '(dylan-continuation-indent 2)
 '(emacs-lisp-docstring-fill-column 79)
 '(erc-menu-mode t)
 '(fill-column 79)
 '(go-fontify-function-calls nil)
 '(go-fontify-variables t)
 '(indent-tabs-mode nil)
 '(lsp-diagnostics-attributes
   '((unnecessary :foreground "gray")
     (deprecated :strike-through t)))
 '(lsp-diagnostics-provider :auto)
 '(lsp-dylan-extra-server-flags '("--debug-opendylan")) ; "--debug-server"
 '(lsp-server-trace "messages")
 '(package-selected-packages
   '(eglot yaml-mode hover lsp-mode protobuf-mode go-mode magit slime))
 '(safe-local-variable-values
   '((Base . 10)
     (Package . CL-PPCRE)
     (Syntax . COMMON-LISP)
     (Syntax . Common-Lisp)))
 '(show-paren-mode nil)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; load emacs 24's package system. Add MELPA repository.
(progn
  (require 'package)

  ;; What the honest fuck?
  ;; https://emacs.stackexchange.com/questions/61997/how-do-i-fix-incomprehensible-buffer-error-when-running-list-packages
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See
  ;; `package-archive-priorities` and `package-pinned-packages`. Most users
  ;; will not need or want to do this.
  (setq package-archives
        '(("melpa-stable" . "https://stable.melpa.org/packages/")))
  ;; (add-to-list 'package-archives
  ;;              '("melpa" . "https://melpa.org/packages/"))
  (package-initialize))


(put 'narrow-to-region 'disabled nil)

;; Get rid of the bad background for things like ReStructured Text headers when
;; inside screen and possibly other times. This probably ought to be
;; conditionalized to the display type.
(let ((frame-background-mode 'light)) (frame-set-background-mode nil))

;;; Shell mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; This makes emacs shell notice when my current directory changes.  In
;; particular it works with the dw (dylan workspace) function in my .bashrc.
(add-hook 'shell-mode-hook 'dirtrack-mode)
(setq-default dirtrack-list
              '("^[0-9][0-9]:[0-9][0-9]:[0-9][0-9] \\([^ ]+\\) "
                1                       ; group to use
                t))                     ; multi-line match?


;;; SLIME / SWANK

(unless (equal system-type 'windows-nt)
  ;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-src/slime-2.23")
  (require 'slime "~/.emacs.d/elpa/slime-2.27/slime.el")
  (slime-setup)
  ;;(load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (global-set-key (kbd "C-c l") 'slime-repl))

;;; Dylan

(defvar *dylan* (or (getenv "DYLAN")
                    (error "DYLAN environment variable not set")))
(setq dylan-mode-dir (concat *dylan* "/pkg/dylan-emacs-support/0.1.0/src"))
(add-to-list 'load-path dylan-mode-dir)
(load (concat dylan-mode-dir "/dylan.el"))
(add-to-list 'auto-mode-alist '("\\.dylan\\'" . dylan-mode))

;;; This can't possibly be the right way to load lsp-mode, right?
(unless (equal system-type 'windows-nt)
  (load-file "~/.emacs.d/elpa/lsp-mode-8.0.0/lsp-mode.el")
  ;; From https://emacs-lsp.github.io/lsp-mode/page/faq/. I'm not sure if this
  ;; is necessary, but it seems like it may be useful so I'm holding onto it.
  '(advice-add 'lsp :before
               (lambda (&rest _args)
                 (setf (lsp-session-server-id->folders (lsp-session))
                       (ht)))))
(load (concat *dylan* "/workspaces/lsp-dylan/lsp-dylan.el"))

(add-hook 'dylan-mode-hook 'lsp)
