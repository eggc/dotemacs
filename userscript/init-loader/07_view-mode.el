;; 片手でコードを眺めたいときに使う。vim 的な操作。 view-mode 標準では C-x C-q で開始。
;; ここを参考に設定 http://d.hatena.ne.jp/rubikitch/20081104/1225745862
(setq view-read-only t)
(defvar pager-keybind
  `( ;; vi-like
    ("h" . backward-word)
    ("l" . forward-word)
    ("j" . next-line)
    ("k" . previous-line)
    ("b" . scroll-down)
    (" " . scroll-up)
    ("i" . view-mode)
    ("a" . view-mode)
    ))
(defun define-many-keys (keymap key-table &optional includes)
  (let (key cmd)
    (dolist (key-cmd key-table)
      (setq key (car key-cmd)
            cmd (cdr key-cmd))
      (if (or (not includes) (member key includes))
          (define-key keymap key cmd))))
  keymap)
(defun view-mode-hook0 () (define-many-keys view-mode-map pager-keybind) )
(add-hook 'view-mode-hook 'view-mode-hook0)

;; 書き込み不能なファイルはview-modeで開くように
(defadvice find-file (around find-file-switch-to-view-file (file &optional wild) activate)
  (if (and (not (file-writable-p file))
           (not (file-directory-p file)))
      (view-file file)
    ad-do-it))

;; 書き込み不能な場合はview-modeを抜けないように
(defvar view-mode-force-exit nil)
(defmacro do-not-exit-view-mode-unless-writable-advice (f)
  `(defadvice ,f (around do-not-exit-view-mode-unless-writable activate)
     (if (and (buffer-file-name)
              (not view-mode-force-exit)
              (not (file-writable-p (buffer-file-name))))
         (message "File is unwritable, so stay in view-mode.")
       ad-do-it)))
(do-not-exit-view-mode-unless-writable-advice view-mode-exit)
(do-not-exit-view-mode-unless-writable-advice view-mode-disable)
