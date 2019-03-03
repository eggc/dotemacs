;; Added by Package.el.  This must come before configurations of installed packages.
(package-initialize)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "LANG" "ja_JP.UTF-8")
(require 'server)
(unless (server-running-p) (server-start))

(load (concat user-emacs-directory "userscript/better-defaults"))
(load (concat user-emacs-directory "userscript/setup-global-keys"))
(load (concat user-emacs-directory "userscript/setup-basics"))
(load (concat user-emacs-directory "userscript/setup-el-get"))

(el-get-bundle! init-loader (init-loader-load (locate-user-emacs-file "userscript/init-loader")))
(el-get-bundle! exec-path-from-shell (exec-path-from-shell-initialize))

;; 日本語入力のちらつき防止。詳細は http://hylom.net/emacs-25.1-ime-flicker-problem
;; (setq redisplay-dont-pause nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block-begin-line ((t (:inherit org-meta-line :foreground "gray53"))))
 '(org-block-end-line ((t (:inherit org-meta-line :foreground "gray53"))))
 '(org-done ((t (:foreground "#009250" :weight bold))))
 '(org-level-1 ((t (:foreground "#007AB7" :inherit outline-1 :weight bold))))
 '(org-level-2 ((t (:foreground "#007AB7" :inherit outline-2))))
 '(org-level-3 ((t (:foreground "#007AB7" :inherit outline-2))))
 '(org-level-4 ((t (:foreground "#007AB7" :inherit outline-2))))
 '(org-level-5 ((t (:foreground "#007AB7" :inherit outline-2))))
 '(org-level-6 ((t (:foreground "#007AB7" :inherit outline-2))))
 '(org-todo ((t (:foreground "#BF1E56" :weight bold))))
 '(vhl/default-face ((t (:background "LightBlue1"))))
 '(vline ((t (:background "gray90")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-ignore-list
   (quote
    ("bundle.js" "bundle.css" "app-all.js" "ext-all-sandbox-debug-w-comments.js" "vendor/bundle")))
 '(async-bytecomp-package-mode t)
 '(c-basic-offset 4)
 '(dired-subtree-use-backgrounds nil)
 '(helm-mini-default-sources
   (quote
    (helm-source-buffers-list helm-source-bookmarks helm-source-files-in-current-dir helm-source-recentf)))
 '(package-selected-packages (quote (nil emms csv-mode)))
 '(rspec-use-rake-when-possible nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(sql-product (quote postgres)))
