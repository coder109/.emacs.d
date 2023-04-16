(add-to-list 'load-path "~/.emacs.d/lisp")
(setq use-package-always-ensure t)
(require 'init-elpa)
(require 'init-emacs)
(require 'init-code)
(require 'init-key)
(require 'init-compile)
(require 'init-ai)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(gptel lsp-python-ms lsp-pyright skewer-mode vue-html-mode scss-mode js2-mode evil org-bullets lsp-latex clojure-mode company-erlang erlang rust-mode racket-mode php-mode go-mode haskell-mode lsp-haskell eglot elixir-mode dart-mode magit counsel web-mode ivy hungry-delete which-key company-quickhelp dap-mode helm-lsp lsp-ui lsp-julia marginalia window-numbering dashboard iedit smex tiny avy projectile dockerfile-mode yaml-mode json-mode undo-tree flycheck lsp-mode elpy hsluv helm company diminish moe-theme highlight-symbol use-package rainbow-delimiters nyan-mode restart-emacs)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
