;;; package --- Summary: ivy setup"
;;; Commentary:
;;; Code:

;; Ivy minibuffer (and other bits) setup. Prefer this over IDO and use
;; historian to remember files I have previously opened.

(use-package historian
  :ensure t
  :after ivy)

(use-package ivy-historian
  :ensure t
  :after ivy)

(use-package ivy
  :ensure t
  :delight
  :init
  (ivy-mode 1)
  (historian-mode 1)

  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  (ivy-display-style 'fancy)

  :bind
  (("C-x b" . ivy-switch-buffer))
   
  :config
  (ivy-mode 1)
  (historian-mode 1)
  (ivy-historian-mode 1)

  ;; Allow recursive minibuffers. Escape quits ivy
  (setq enable-recursive-minibuffers t)
  (define-key ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit))

(use-package ivy-prescient
  :ensure t
  :delight
  :after ivy
  :config
  (ivy-prescient-mode))

(use-package all-the-icons-ivy
  :ensure t
  :delight
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-file-commands '(counsel-dired-jump
                                            counsel-find-file
                                            counsel-file-jump
                                            counsel-find-library
                                            counsel-git
                                            counsel-projectile-find-dir
                                            counsel-projectile-find-file
                                            counsel-recentf))
  :config (all-the-icons-ivy-setup))

;; Provide extra context information in Ivy's display.
(use-package ivy-rich
  :ensure t
  :after (ivy)
  :init
  (setq ivy-rich-path-style 'abbrev
        ivy-virtual-abbreviate 'full)
  :config (ivy-rich-mode 1))

(use-package swiper
  :ensure t
  :after (ivy)
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(provide 'ivy-setup)
;;; ivy-setup.el ends here
