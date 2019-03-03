(setq sql-postgres-program "/usr/local/bin/psql")

;; emacs の中で psql を開くには sql-postgres コマンドを実行する。
;; その状態で sql-send-buffer や sql-send-region を使えば、
;; emacs で編集した内容を即座に実行できる。

(custom-set-variables '(sql-product 'postgres))
