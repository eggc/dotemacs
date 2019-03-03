;; web-mode: ERB とかできていい感じ。http://web-mode.org/
;; rjsx-mode と競合してバグるので停止。

;; (el-get-bundle web-mode
;;   (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;   (setq web-mode-markup-indent-offset 2)
;; )

;; (setq web-mode-enable-auto-pairing t)
;; 色が見にくいので変える。
;; http://qiita.com/ironsand/items/dff1f16b295df0abbdad
;; (set-face-attribute 'web-mode-symbol-face nil :foreground "#DD6600")

;; インデント幅を 2 にする
;; (setq js-indent-level 2)
