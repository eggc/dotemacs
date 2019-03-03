(el-get-bundle ruby-mode)

(add-to-list 'auto-mode-alist '("\\.ruby$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile$" . ruby-mode))

(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren-style nil)

;; Setting rbenv path:  http://marc-bowes.com/2012/03/10/rbenv-with-emacs.html
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

(el-get-bundle rubocop)
(define-key ruby-mode-map (kbd "C-c , R") 'rubocop-autocorrect-current-file)

;; https://github.com/pezra/rspec-mode
(el-get-bundle rspec-mode)

;; 覚えておくと良いコマンド
;; C-c , v  現在のバッファをテスト
;; C-c , a  現在のプロジェクトをテスト
;; C-c , s  現在のカーソル行をテスト


(el-get-bundle yard-mode
  (add-hook 'ruby-mode-hook 'yard-mode)
)
