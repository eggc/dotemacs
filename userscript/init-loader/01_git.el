;;git-gutter 重いので NG
;; (global-git-gutter-mode +1)
;; (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
;; (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
;; (set-face-foreground 'git-gutter:added "darkgreen")
;; (set-face-foreground 'git-gutter:deleted "red")

; magit をロードする前に emacsclient のパスを明示しておく。
;; (set-variable 'magit-emacsclient-executable "/usr/local/bin/emacsclient")
(el-get-bundle! magit)

(global-set-key (kbd "C-M-g") 'magit-status)
;; (add-hook 'magit-status-mode-hook (lambda ()
;;   (local-set-key (kbd "j")     'next-line)
;;   (local-set-key (kbd "k")     'previous-line)
;; ))

(setq magit-auto-revert-mode nil)   ; (global-auto-revert-mode 1) で足りるので無効化
(setq magit-revert-buffers 'silent) ; revert するときに警告しない

;; git commit 時に diff が開くのをやめる。
(remove-hook 'server-switch-hook 'magit-commit-diff)

;; magit status がデフォルトではバッファを分割するので、狭くて使いにくいのをやめる
;; 古いバージョンでは下記の方法で対処できたが v2 からはダメ
;; (setq magit-status-buffer-switch-function 'switch-to-buffer)
;; 新しいバージョンでは下記の方法でやる。
;; https://github.com/magit/magit/issues/2541
(setq magit-display-buffer-function
      (lambda (buffer)
        (display-buffer
         buffer (if (and (derived-mode-p 'magit-mode)
                         (memq (with-current-buffer buffer major-mode)
                               '(magit-process-mode
                                 magit-revision-mode
                                 magit-diff-mode
                                 magit-stash-mode
                                 magit-status-mode)))
                    nil
                  '(display-buffer-same-window)))))

;; 分割してるのが一つに戻ります。
;; https://github.com/magit/magit/issues/1953#issuecomment-221134023
;; (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
