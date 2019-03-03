;; gfm mode = github flavor markdown mode
(el-get-bundle markdown-mode
  (add-to-list 'auto-mode-alist '("\\.md" . gfm-mode))
  ;; orgtable を使えるようにする
  ;; http://qiita.com/nanasess/items/c9342c06a3e28e64aeb8
  (require 'org-table)
  (defun cleanup-org-tables () (save-excursion (goto-char (point-min)) (while (search-forward "-+-" nil t) (replace-match "-|-"))))
  (add-hook 'markdown-mode-hook 'orgtbl-mode)
  (add-hook 'markdown-mode-hook (lambda() (add-hook 'after-save-hook 'cleanup-org-tables  nil 'make-it-local)))
  (add-hook 'markdown-mode-hook (lambda() (local-set-key (kbd "C-c p") 'markdown-preview)))
)
