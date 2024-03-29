;; sass-mode
;; インデント幅を2にする
;; コンパイルは compass watchで行うので自動コンパイルをオフ
(el-get-bundle scss-mode)
(require 'scss-mode)
(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)
   )
  )
(add-hook 'scss-mode-hook  '(lambda() (scss-custom)))
