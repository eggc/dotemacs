;; ! を押した時シェルコマンドを実行し、 dired でフォーカスしたファイルを引数に渡す
;; i を押した時のサブツリーを見やすくするコマンドを定義
(el-get-bundle dired-hacks)
(require 'wdired)         ; Dired バッファの上でファイル名をリネームできるようにする
(require 'dired-subtree)

(add-hook 'dired-mode-hook (lambda ()
  (local-unset-key (kbd "C-t"))                         ; 普段の C-t をそのまま
  (local-set-key (kbd "j")     'dired-next-line)        ; vim のような上下移動
  (local-set-key (kbd "k")     'dired-previous-line)    ; vim のような上下移動
  (local-set-key (kbd "<tab>") 'dired-subtree-insert)   ; サブツリーを見やすく開く(org-modeと揃える)
  (local-set-key (kbd "i")     'dired-subtree-insert)   ; サブツリーを見やすく開く
  (local-set-key (kbd "h")     'dired-subtree-remove)   ; サブツリーを隠す
  (local-set-key (kbd "r")     'wdired-change-to-wdired-mode) ; ファイル名編集
))

(setq
 dired-dwim-target t             ; 2個のdiredバッファがある時、コピー/移動先のパスを他方のバッファにする
 dired-listing-switches "-ahgo" ; ls と同じオプション。色つけたりして見やすくする
)

;; 下のようなメッセージを回避するには、gls をインストールする必要がある
;; ls does not support --dired; see `dired-use-ls-dired' for more details.
;; http://qiita.com/maangie/items/5a80ae50c13d14368a72
(let ((gls "/usr/local/bin/gls")) (if (file-exists-p gls) (setq insert-directory-program gls)))

(custom-set-variables
 '(dired-subtree-use-backgrounds nil)
)
