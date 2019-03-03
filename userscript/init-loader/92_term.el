;; emacs の中での term
;; プロンプト以外のところにカーソルを動かすことができない。
;; C-x, M-x, C-t とか色々なキーバインドが奪われるのが不快。
;; たぶんシェルの中で吸収してる。あとは、ターミナルに対する C-r は使えない。
;; emacs の中での shell
;; プロンプト以外のところにカーソルを動かすことができる。コピー＆ペーストは楽。
;; キーバインドは奪わないが、ターミナルに対する C-r は使えない。
;; C-c でシグナルを送ったりすることもできない。history すら保管できない。とても不便。
;; multi-term
;; プロンプト以外のところにカーソルを動かすことができる。コピー＆ペーストは楽。
;; M-r で reverse-search-history を使える。
;; C-c C-c で C-c の kill シグナルを送ることができる。
;; C-c C-e で ESC を送る。
;; ただし terminfo を作る必要がある（下記）
;; http://stackoverflow.com/questions/8918910/weird-character-zsh-in-emacs-terminal

(el-get-bundle multi-term)
(require 'multi-term)
(add-to-list 'term-unbind-key-list "C-t")
(setq locale-coding-system 'utf-8)
(add-hook 'term-mode-hook '(lambda ()
                             (define-key term-raw-map (kbd "s-c") 'kill-ring-save)
                             (define-key term-raw-map (kbd "C-c C-a") 'beginning-of-line)
                             (define-key term-raw-map (kbd "C-c C-e") 'end-of-line)
			     (define-key term-raw-map (kbd "s-v") 'term-paste)
			     (define-key term-raw-map (kbd "C-y") 'term-paste)
			     (define-key term-raw-map [delete] 'term-send-raw)
                             (define-key term-raw-map "\C-z"
                               (lookup-key (current-global-map) "\C-z"))))
;; vim を動かすと backspace が ^? になるのは何とかしたい。
;; C-b C-f もいじったらおかしなことになった。うーんなんか色々と闇が深い。
