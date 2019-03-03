;; http://rubikitch.com/2014/12/08/better-defaults/ に手を加えたもの
(ido-mode t)
(setq ido-enable-flex-matching t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)
(setq save-interprogram-paste-before-kill t)
(setq require-final-newline t)
(setq visible-bell t)
;; (setq ring-bell-function 'ignore)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq backup-directory-alist `((".*". ,temporary-file-directory)))
