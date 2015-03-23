;; .emacs initialization file  ; -*- mode: emacs-lisp -*-

;; allow packages to be installed from MELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; Provide alternate bindings for M-x execute-extended-command
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Rebind backward-kill-word
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; More shortcuts
(global-set-key "\M-g" 'goto-line)

;; Use 72-column fills in git-commit mode.
(add-hook 'git-commit-mode-hook
          (lambda () (set-fill-column 72)))
(add-hook 'git-commit-mode-hook
          '(lambda () (font-lock-set-up-width-warning 72)))

;; toggle useful minor modes
(global-font-lock-mode 1)
(column-number-mode 1)
(transient-mark-mode 1)
(auto-compression-mode 1)

;;save the emacs session
(desktop-load-default)
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(desktop-read)
(setq desktop-enable t)

;; Turn on red highlighting for characters outside of the 80 char limit
(setq-default fill-column 80)
(add-hook 'c++-mode-hook
          '(lambda () (font-lock-set-up-width-warning 80)))
(add-hook 'java-mode-hook
          '(lambda () (font-lock-set-up-width-warning 80)))
(add-hook 'python-mode-hook
          '(lambda () (font-lock-set-up-width-warning 80)))
(add-hook 'ruby-mode-hook
          '(lambda () (font-lock-set-up-width-warning 80)))
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Markdown major mode.
(when (not (require 'markdown-mode nil t))
  (package-install 'markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; Add a default color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

;; use spaces to indent files
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)
