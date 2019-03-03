;; 括弧の範囲内を強調表示
;; (show-paren-mode t)
;; (set-face-background 'show-paren-match "green")

;; http://qiita.com/ShingoFukuyama/items/ed1af137a98e0028e025
;; (el-get-bundle 'smartparens)
;; (require 'smartparens)
;; (require 'smartparens-config)
;; (smartparens-global-mode)
;; (ad-disable-advice 'delete-backward-char 'before 'sp-delete-pair-advice)
;; (ad-activate 'delete-backward-char)

;; カッコの補完 -> smartparents.el に移行。
;; 組み込みの electric-pair-mode は領域を囲めないので NG
;; (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
;; (defvar skeleton-pair 1)
