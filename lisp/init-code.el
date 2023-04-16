;; Set coding system to utf-8
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)

;; Allow folding codes
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; Allow deleting selected area
(delete-selection-mode t)

;; Save when file is killed
(setq make-backup-files nil)

;; Python enhancement
(elpy-enable)

;; LSP
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c-mode      . lsp)
	 (julia-mode . lsp)
	 (lua-mode   . lsp)
	 (ocaml-mode . lsp)
	 (perl-mode  . lsp)
	 (dart-mode  . lsp)
	 (haskell-mode . lsp)
	 (go-mode . lsp)
	 (php-mode . lsp)
	 (racket-mode . lsp)
	 (ruby-mode . lsp)
	 (rust-mode . lsp)
	 (erlang-mode . lsp)
	 (elixir-mode . lsp)
	 (clojure-mode . lsp)
	 (verilog-mode . lsp)
	 )
  :commands lsp
  :init
  (setq lsp-auto-configure t
	lsp-auto-guess-root t
	lsp-idle-delay 0.500
	lsp-session-file "~/.emacs/.cache.lsp-sessions"))
(require 'lsp-python-ms)
(setq lsp-python-ms-auto-install-server t)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

;; LSP-latex
(setq lsp-latex-java-executable "usr/bin/java")
(setq lsp-latex-texlab-jar-file 'search-from-exec-path)

;; LSP-juliaLang
(use-package lsp-julia
  :config
  (setq lsp-julia-default-environment "~/.julia/environments/v1.7"))

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; LSP-Haskell
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)



;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; Debugger
(use-package dap-mode
  :ensure t
  :commands dap-debug
  :custom
  (dap-auto-configure-mode t)
  :config
  (dap-ui-mode 1)
  )
(require 'dap-python)
;; Syntax checking
(global-flycheck-mode t)

;; Code auto-fix
(yas-global-mode t)

;; Undo-tree
(add-hook 'after-init-hook 'global-undo-tree-mode)

;; Web development support
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;; Project manager
(projectile-global-mode t)
(setq projectile-enable-caching t)

(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

(evil-mode 1)

(provide 'init-code)
