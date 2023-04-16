;; Basic UI config
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode t)
(column-number-mode t)
(add-hook 'after-init-hook 'nyan-mode)

;; Display time
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; Window-numbering
(add-hook 'after-init-hook 'window-numbering-mode)

;; which-key for command hiny
(which-key-mode)

;; Allow deleting continuous blank
;;(global-hungry-delete-mode)

;; Auto-fix enhancement
(use-package ivy
  :ensure t
  )
(add-hook 'after-init-hook 'ivy-mode)


;; Comment for minibuffer
(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
			  ("M-A" . marginalia-cycle)))

;; Launch Page config
(use-package dashboard
  :ensure t
  :config (dashboard-setup-startup-hook))
(setq dashboard-banner-logo-title "Let's all love Lain...")
(setq dashboard-startup-banner "/home/bruce/Lain_avatar.png")
(setq dashboard-image-banner-max-height 300)
(setq dashboard-image-banner-max-width 300)
(setq dashboard-center-content t)

;; Brace multicolor
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; Highlight same symbols
(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("C-c h" . highlight-symbol))

;; Command auto-fix
(helm-mode 1)
(smex-initialize)

;; Text auto-fix
(global-company-mode t)
(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0)
(setq company-selection-wrap-around t)
(company-quickhelp-mode)
;; Brace auto-fix
(electric-pair-mode t)

;; Theme config
(use-package moe-theme)
(show-paren-mode t)
(setq moe-theme-mode-line-color 'blue)
(setq show-paren-style 'expression)
(moe-dark)
(powerline-default-theme)

;; Diminish
(diminish 'company-mode)
(diminish 'helm-mode)
(diminish 'eldoc-theme)

;; Font config
(setq fonts '("Source Code Pro Medium" "Microsoft YaHei"))
(set-fontset-font t 'unicode "Segoe UI Emoji" nil 'prepend)
(set-face-attribute 'default nil
		    :font (format "%s:pixelsize=%d" (car fonts) 20))

(setq default-frame-alist '((font . "Source Code Pro-16")))

(if (display-graphic-p)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
			(font-spec :family (car (cdr fonts))))))

;; Org-mode config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Swapping 2 windows
(defun transpose-windows ()
  (interactive)
  (let ((this-buffer (window-buffer (selected-window)))
        (other-buffer (prog2
                          (other-window +1)
                          (window-buffer (selected-window))
                        (other-window -1))))
    (switch-to-buffer other-buffer)
    (switch-to-buffer-other-window this-buffer)
    (other-window -1)))

(global-set-key (kbd "C-c c") 'transpose-windows)

(provide 'init-emacs)
