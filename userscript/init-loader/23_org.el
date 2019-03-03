(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))

;; org-mode にコードを埋め込んだ時に、色付けする。
;; ただし、#+BEGIN_SRC perl とかそんなふうな特殊コメントがいる。
;; それを入れるには <s TAB で良い。
(setq org-src-fontify-natively t)
(setq org-hide-leading-stars t)       ; 見出しの余分な*を隠す

;; SHIFT と矢印で C-c C-b や C-c C-f , C-c C-uと同じ効果。
(add-hook 'org-mode-hook (lambda ()
  (local-set-key (kbd "S-<up>") 'org-backward-heading-same-level)
  (local-set-key (kbd "S-<down>") 'org-forward-heading-same-level)
  (local-set-key (kbd "S-<left>") 'outline-up-heading)
  (local-unset-key (kbd "M-h"))    ; org-mode の M-h を利用しない。
  (org-indent-mode t)              ; インデントをヘッダに合わせる。
  ))

(setq org-todo-keywords
      '((sequence "TODO" "DOING" "DONE" )))

;; 赤 "#BF1E56"
(custom-set-faces
 '(org-block-begin-line ((t (:inherit org-meta-line :foreground "gray53"))) t)
 '(org-block-end-line ((t (:inherit org-meta-line :foreground "gray53"))) t)
 '(org-level-1 ((t (:foreground "#007AB7" :inherit outline-1 :weight bold))))
 '(org-level-2 ((t (:foreground "#007AB7" :inherit outline-2))))
 '(org-level-3 ((t (:foreground "#007AB7":inherit outline-2))))
 '(org-level-4 ((t (:foreground "#007AB7":inherit outline-2))))
 '(org-level-5 ((t (:foreground "#007AB7":inherit outline-2))))
 '(org-level-6 ((t (:foreground "#007AB7":inherit outline-2))))
 '(org-todo ((t (:foreground "#BF1E56" :weight bold))))
 '(org-done ((t (:foreground "#009250" :weight bold))))
)
