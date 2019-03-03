;; トラックパッド or マウスホイールでのスクロール量を少なくする。
(defun scroll-down-with-lines ()  "" (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()    "" (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
