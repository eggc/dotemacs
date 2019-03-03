;; 覚えておきたいコマンド
;; eww-previous-url はブラウザの戻るボタン（ヒストリバック）。キーバインドは l
;; eww-forward-url  はブラウザの進むボタン。キーバインドは r
;; eww-forward-url  はセッションの履歴。キーバインドは H
;; eww-browse-with-external-link で OS の定めたブラウザで開く。キーバインドは & 。

;; 参考
;; http://rubikitch.com/tag/eww/
;; http://futurismo.biz/archives/2950

(require 'eww)

;; 検索サイトを google にする。デフォルトは duckduckgo
(setq eww-search-prefix "http://www.google.co.jp/search?q=")

(defun eww-disable-images ()
  "eww で画像表示させない"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image-alt)
  (eww-reload))
(defun eww-enable-images ()
  "eww で画像表示させる"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image)
  (eww-reload))
(defun shr-put-image-alt (spec alt &optional flags)
  (insert alt))
;; はじめから非表示
(defun eww-mode-hook--disable-image ()
  (setq-local shr-put-image-function 'shr-put-image-alt))
(add-hook 'eww-mode-hook 'eww-mode-hook--disable-image)


;; 背景・文字色を無効化する
(defvar eww-disable-colorize t)
(defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
  (unless eww-disable-colorize
    (funcall orig start end fg)))
(advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
(advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
(defun eww-disable-color ()
  "ewwで文字色を反映させない"
  (interactive)
  (setq-local eww-disable-colorize t)
  (eww-reload))
(defun eww-enable-color ()
  "ewwで文字色を反映させる"
  (interactive)
  (setq-local eww-disable-colorize nil)
  (eww-reload))

(add-hook 'eww-mode-hook (lambda ()
  (local-set-key (kbd "j")     'next-line)
  (local-set-key (kbd "k")     'previous-line)
  (local-set-key (kbd "i")     'eww-enable-images)
  (local-set-key (kbd "o")     'eww-disable-images)
))
