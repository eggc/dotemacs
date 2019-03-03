(el-get-bundle auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(global-auto-complete-mode t)
(ac-config-default)

;; auto-complete で大文字小文字を区別する。
(setq ac-ignore-case nil)
(setq ac-auto-start 4)
(setq ac-comphist-file "~/.emacs.d/history/ac-comphist.dat")

(add-to-list 'ac-modes 'sql-mode)
(add-to-list 'ac-modes 'coffee-mode)
(add-to-list 'ac-modes 'haml-mode)
(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'scss-mode)
(add-to-list 'ac-modes 'c++-mode)
