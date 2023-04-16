;;Shell in New Window
(defun shell-in-new-window()
  (interactive)
  (split-window-below)
  (shell))

(global-set-key (kbd "<f6>") 'shell-in-new-window)

(defun c-quick-compile ()
  (interactive)
  (compile (format "gcc %s && ./a.out" (buffer-name) ) t)
  )

;;(defun haskell-quick-compile ()
;;  (interactive)
;;  (compile (format "ghc %s" (buffer-name)) t)
;;  )

(defun java-quick-compile ()
  (interactive)
  (compile (format "java %s" (buffer-name)) t)
  )

(defun lua-quick-compile ()
  (interactive)
  (compile (format "lua %s" (buffer-name)) t)
  )

(defun py-quick-compile ()
  (interactive)
  (compile (format "python3 %s" (buffer-name)) t)
  )

(defun html-quick-compile ()
  (interactive)
  (browse-url-of-buffer)
  )

(defun clisp-quick-compile ()
  (interactive)
  (compile (format "clisp %s" (buffer-name)) t)
  )

(defun quick-compile ()
  (interactive)
  (if (eq major-mode 'c-mode)
      (c-quick-compile))
  (if (eq major-mode 'python-mode)
      (py-quick-compile))
  (if (eq major-mode 'html-mode)
      (html-quick-compile))
  (if (eq major-mode 'java-mode)
      (java-quick-compile))
  (if (eq major-mode 'lua-mode)
      (lua-quick-compile))
  (if (eq major-mode 'lisp-mode)
      (clisp-quick-compile)
      )
  )

(defun c-compile-no-run ()
  (interactive)
  (compile (format "gcc %s" (buffer-name)))
  )

(defun java-compile-no-run ()
  (interactive)
  (compile (format "javac %s" (buffer-name)))
  )

(defun compile-no-run ()
  (interactive)
  (if (eq major-mode 'java-mode)
      (java-compile-no-run))
  (if (eq major-mode 'c-mode)
      (c-compile-no-run))
  )

(global-set-key (kbd "<f8>") 'quick-compile)
(global-set-key (kbd "<f9>") 'compile-no-run)


(provide 'init-compile)
