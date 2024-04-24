;; Use f7 to generate the Super key on tty emacs.
(keymap-global-set "<f7>" nil)
(keymap-global-set "<f8>" nil)
(keymap-set function-key-map "<f7>" 'event-apply-super-modifier)
(keymap-set function-key-map "<f8>" 'event-apply-hyper-modifier)

(keymap-global-set "C-c c" 'compile)    ; C-c c to compile
(keymap-global-set "C-c s" 'shell)      ; C-c s to get a shell
(keymap-global-set "C-x C-b" 'ibuffer)  ; ibuffer instead of list-buffers

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
 '(global-hl-line-mode t)
 '(go-fontify-function-calls nil)
 '(go-fontify-variables t)
 '(ibuffer-expert t)
 '(ibuffer-formats
   '((mark modified read-only locked " "
           (name 28 28 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process)
     (mark " "
           (name 16 -1)
           " " filename)))
 '(indent-tabs-mode nil)
 '(lsp-diagnostics-attributes
   '((unnecessary :foreground "gray")
     (deprecated :strike-through t)))
 '(lsp-diagnostics-provider :auto)
 '(lsp-dylan-extra-command-line-options '("--debug-server" "--debug-opendylan"))
 '(lsp-dylan-extra-server-flags '("--debug-opendylan"))
 '(lsp-server-trace "messages")
 '(package-selected-packages
   '(lsp-treemacs flycheck lsp-ui typescript-mode slime markdown-mode marginalia eglot yaml-mode hover lsp-mode protobuf-mode go-mode magit))
 '(safe-local-variable-values
   '((Base . 10)
     (Package . CL-PPCRE)
     (Syntax . COMMON-LISP)
     (Syntax . Common-Lisp)))
 '(show-paren-mode nil)
 '(show-trailing-whitespace t)
 '(slime-truncate-lines nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(cursor ((t (:background "red1"))))
 '(hl-line ((t (:extend t :background "DarkOrchid4")))))

(progn
  (require 'package)

  ;; What the honest fuck?
  ;; https://emacs.stackexchange.com/questions/61997/how-do-i-fix-incomprehensible-buffer-error-when-running-list-packages
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

  (setq package-archives
        '(("melpa" . "https://melpa.org/packages/")
          ;;("melpa-stable" . "https://stable.melpa.org/packages/")
          ("gnu" . "https://elpa.gnu.org/packages/")
          ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
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



;; Globally enable winner mode, which binds C-c <Left> to "revert to previous
;; window configuration" and C-c <Right> to "revert the revert".
(winner-mode 1)


;;; SLIME / SWANK

(unless (equal system-type 'windows-nt)
  (require 'slime)
  (slime-setup)
  (setq inferior-lisp-program "sbcl")
  (keymap-global-set "C-c l" 'slime-repl))


;;; Dylan

(defvar *dylan* (or (getenv "DYLAN")
                    (error "DYLAN environment variable not set")))
(setq dylan-emacs-dir (concat *dylan* "/workspaces/dylan-emacs-support"))
(add-to-list 'load-path dylan-emacs-dir)
(load (concat dylan-emacs-dir "/dylan.el"))
(add-to-list 'auto-mode-alist '("\\.dylan\\'" . dylan-mode))

;; https://emacs-lsp.github.io/lsp-mode/page/installation/ has links to various
;; fancy UI add-ons for lsp-mode too. Might be worth a look later.
(require 'lsp-mode)
(use-package lsp-ui) ; not sure what this does yet. supposed to augment lsp-mode.
(load (concat *dylan* "/workspaces/lsp/lsp-dylan/lsp-dylan.el"))

(add-hook 'dylan-mode-hook 'lsp)

;; Uncomment when testing DIME, but otherwise DIME interferes with LSP.
;; (require 'dime)
;; (dime-setup '(dime-repl dime-note-tree))
;; (setq dime-dylan-implementations
;;       `((opendylan (,(format "%s/opendylan/bin/dswank" *dylan*))
;;                    :env (,(format "OPEN_DYLAN_USER_REGISTRIES=/tmp/dime-test/registry:%s/workspaces/opendylan/sources/registry"
;;                                   *dylan*)))))
