;;; package --- Summary: Packages setup"
;;; Commentary:
;;; Code:

;; GNU and MELPA package manager setup.

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)


;; Install, if needed, and then bootstrap `use-package' and use it throughout
;; the rest of Emacs' configuration

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Basic `use-package` defaults

(setq-default use-package-always-ensure t ; Auto-download package if not exists
              use-package-always-defer t ; Always defer load package to speed up startup
              use-package-verbose nil ; Don't report loading details
              use-package-expand-minimally t  ; make the expanded code as minimal as possible
              use-package-enable-imenu-support t) ; Let imenu find use-package definitions

;; Diminish minor modes from the modeline. We like minor modes, they're useful,
;; but we don't need to know they are on. This package does away with the
;; minor-modes registering themselves against the modeline but still allows them
;; to function. So, a sane modeline, more or less.
(use-package delight
  :ensure t
  :demand t)

(provide 'package-setup)
;;; package-setup.el ends here
