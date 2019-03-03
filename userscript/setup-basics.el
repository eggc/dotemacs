(setq inhibit-startup-message t)    ; 起動時にタイトルのバッファを開かない。
(setq echo-keystrokes 0.1)           ; キーストローク C-x とかをエコーエリアに早く表示する。
(setq history-delete-duplicates t)   ; 同じ内容を履歴に記録しないようにする
(setq set-mark-command-repeat-pop t) ; C-u C-SPC C-SPC ...でどんどん過去のマークを遡る
(setq compilation-scroll-output t)   ; コンパイル(rspecも含む)時に自動でスクロール
(setq auto-save-file-name-transforms `((".*", temporary-file-directory t)))  ; autosaveを /tmp に置く
(setq recentf-max-saved-items 255)

(column-number-mode t)       ; モードラインに行と桁の番号を表示する
(savehist-mode t)            ; ミニバッファの履歴を保存する
(global-hl-line-mode)        ; 現在行をハイライトする。
(global-auto-revert-mode 1)  ; ファイルの更新がある場合、自動で再読み込みする
(set-face-foreground 'fringe "gray")                     ; 行末折り返し記号の色
(set-face-attribute 'default nil :family "Ricty" :height 180)

(fset 'yes-or-no-p 'y-or-n-p) ; yes or no の質問を y, n で答えられるようにする

(add-hook 'before-save-hook 'delete-trailing-whitespace)   ; ファイル保存時、余白を自動で削除。

;; http://www.ysnb.net/meadow/meadow-users-jp/2012/msg00010.html
;; SJIS のファイルを開いた時にローマ数字などが表示されないのを回避。
(set-charset-priority 'ascii
                      'japanese-jisx0208
                      'latin-jisx0201
                      'katakana-jisx0201
                      'iso-8859-1
                      'cp1252
                      'unicode)
(set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)
