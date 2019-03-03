;; jsx と flow をサポートできてないので js2-mode はしばらく止めておく
;; https://github.com/mooz/js2-mode/issues/224
;; https://github.com/HairyRabbit/js2-mode/issues/6 ここが解決したら入れてみよう。

;; (el-get-bundle js2-mode
;;   (setq-default js2-global-externs (list "require" "describe" "it" "expect" "artifacts" "beforeEach" "contract" "assert" "module" "global"))
;;   (setq-default js2-basic-offset 2)
;;   (setq-default js2-strict-missing-semi-warning nil)
;;   (setq-default js2-missing-semi-one-line-override nil)
;;   (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; rjsx-mode は何か動きがおかしい。
;; 具体的には <div status={{hoge:"fuga", type: 1}}/> を入れたらカンマ叩いたときに何故か行頭に飛ぶ
;; コロンのとき、二回目の { のときにインデントが壊れる。グッチャグチャである。
(el-get-bundle rjsx-mode
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
  (setq-default js-indent-level 2)
  (setq-default js2-strict-missing-semi-warning nil))

;; (el-get-bundle flow-for-emacs (load "flow")) → 普通に使えないしメンテもされてない…。
