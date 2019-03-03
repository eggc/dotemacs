;; エラーになるので list-package でインストールする -> csv-mode,  ...
(el-get-bundle yaml-mode)
(el-get-bundle slim-mode)
(el-get-bundle haml-mode)
(el-get-bundle jade-mode)
(el-get-bundle dockerfile-mode)

(add-to-list 'auto-mode-alist '("\\.pug\\'" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml\\.tmp\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml\\.example\\'" . yaml-mode))

;; 同時押しに対してキーバインドを与える
(el-get-bundle! key-chord
  (defun insert-current-date () (interactive)
         (insert
          (shell-command-to-string "echo -n $(LANG=ja_JP date +%Y/%m/%d（%a）)")))
  (defun open-current-buffer-by-system () (interactive)
         (async-shell-command(concatenate 'string "open " buffer-file-name)))
  (setq key-chord-two-keys-delay 0.04)
  (key-chord-mode 1)
  (key-chord-define-global "jk" 'view-mode)
  (key-chord-define-global "fj" 'insert-current-date)
  (key-chord-define-global "gh" 'magit-status)
  (key-chord-define-global "jn" 'open-junk-file)
  ;; (key-chord-define-global "opn" 'open-current-buffer-by-system) ミスタイプが多いので解除
)

;; yank, kill が行われた領域をハイライト
(el-get-bundle! volatile-highlights
  (volatile-highlights-mode t)
  (custom-set-faces '(vhl/default-face ((t (:background "LightBlue1")))))
)

;; 絵文字を使う設定　https://github.com/iqbalansari/emacs-emojify
;; あとでいれてみたい。

;; 使わなくなったもの
;; anzu / desktop-save-mode / swbuff / elscreen
;; tabbar /diary-mode / ido, ido-menu / string-inflection

;; メディアプレイヤー emms ちょっときつい再生までたどり着かない
;; -> cmus という神ツールを発見。これを multi-term と組み合わせると emacs で楽曲が聴ける
