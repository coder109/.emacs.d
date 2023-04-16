;; Package Management and Basic Operations
(global-set-key (kbd "C-c p i") 'package-install)
(global-set-key (kbd "C-c p d") 'package-delete)
(global-set-key (kbd "C-c r") 'restart-emacs)
(global-set-key (kbd "C-c m") 'toggle-frame-maximized)

;;Shell
(global-set-key (kbd "C-c s") 'shell)

;; Shut the C-z fuck off
(global-set-key (kbd "C-z") 'toggle-frame-maximized)
;;Better Search
(global-set-key (kbd "C-c i") 'iedit-mode)

;;Avy:Jump without mouse
(global-set-key (kbd "C-c a c") 'avy-goto-char-timer)
(global-set-key (kbd "C-c a l") 'avy-goto-line)
(global-set-key (kbd "C-c a a") 'avy-copy-line)
(global-set-key (kbd "C-c a b") 'avy-copy-region)
(global-set-key (kbd "C-c a m") 'avy-move-line)
(global-set-key (kbd "C-c a n") 'avy-move-region)

;;Auto generate similar content
(global-set-key (kbd "C-c t") 'tiny-expand)

;;Smart Alt+X
(global-set-key (kbd "M-x") 'smex)

(provide 'init-key)
