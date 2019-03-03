;; 下記の設定を参考に
;; http://tuhdo.github.io/helm-intro.html
;; http://d.hatena.ne.jp/sugyan/20140227/1393511303
(el-get-bundle helm)
(el-get-bundle helm-ls-git)
(require 'helm)
(require 'helm-config)
(require 'helm-ls-git)

;; helm-occur や helm-occur-from-isearch が便利

(helm-mode 1)
(global-set-key (kbd "s-f") 'helm-find-files)
(global-set-key (kbd "s-b") 'helm-mini)
(global-set-key (kbd "s-g") 'helm-ls-git-ls)
(global-set-key (kbd "M-i") 'helm-imenu)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i")   'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")   'helm-select-action)

;; (when (executable-find "curl") (setq helm-google-suggest-use-curl-p t))
(setq
 helm-buffers-fuzzy-matching           t
 helm-ff-search-library-in-sexp        t
 helm-scroll-amount                    8
 helm-ff-file-name-history-use-recentf t
 helm-buffer-max-length                50
)

;; (custom-set-faces
;; '(helm-ff-dotted-directory ((t (:foreground "green4"))))
;; '(helm-ls-git-modified-and-staged-face ((t (:foreground "DarkOrange2"))))
;; '(helm-ls-git-modified-not-staged-face ((t (:foreground "DarkOrange1"))))
;; '(helm-ls-git-renamed-modified-face ((t (:foreground "DarkOrange1"))))
;; )

(custom-set-variables
 '(helm-mini-default-sources
   (quote
    (helm-source-buffers-list
     helm-source-bookmarks
     helm-source-files-in-current-dir
     helm-source-recentf)))
)
