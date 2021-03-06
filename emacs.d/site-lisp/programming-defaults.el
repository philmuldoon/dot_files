;;; package --- Summary: Universal programming mode and packages setup"
;;; Commentary:
;;; Code:

;; prog-mode setup. Compiled, more or less, from years of use and slimmed down
;; here for Ruby/Rails.

(defun my-prog-mode-hook ()

  ;; Always show line numbers in prog-mode
  (global-display-line-numbers-mode)
  (setq linum-format "%4d")
  (setq column-number-mode t)
  (setq line-number-mode t)

  ;; Language tabs
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq-default c-basic-offset 2)
  (setq css-indent-offset 2)
  (setq js-indent-level 2)
  (setq ruby-indent-level 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2))

(add-hook 'prog-mode-hook #'my-prog-mode-hook)

;; Snippets are useful occasionally.

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t
    :delight)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/ym-snippets"))
  (yas-global-mode t)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "C-'") #'yas-expand)
  (yas-reload-all  (defun help/yas-after-exit-snippet-hook-fn ()
    (prettify-symbols-mode)
    (prettify-symbols-mode)))
  (add-hook 'yas-after-exit-snippet-hook #'help/yas-after-exit-snippet-hook-fn)
  :delight)

;; I like indent guides, especially in rspec test code which can be deeply indented.

(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-responsive 'stack)
  :delight)
  
(use-package editorconfig
  :ensure t
  :demand t
  :config
  (editorconfig-mode 1)
  :delight)

(provide 'programming-defaults)
;;; programming-defaults.el ends here
