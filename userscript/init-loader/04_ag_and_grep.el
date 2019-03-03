(el-get-bundle ag)
(el-get-bundle wgrep
  (require 'wgrep)
  (setf wgrep-enable-key "r")
  (setq wgrep-auto-save-buffer t)
)
