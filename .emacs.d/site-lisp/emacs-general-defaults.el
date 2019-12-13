;;; package --- Summary: General emacs settings"
;;; Commentary:
;; An ancient set of defaults.
;;; Code:

;; ** General startup configury.

;; Startup
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(tool-bar-mode -1)

;; Cursor preference
(setq-default cursor-type 'box)
(set-cursor-color "#ffffff") 

;; Always highlight current line
(setq hl-line-mode t)

;; No bells
(setq ring-bell-function 'ignore)

;; Margin behaviour
(setq scroll-margin 5
      scroll-preserve-screen-position 1)

;; 80 char fill column
(setq-default fill-column 80)

;; Don’t warn me about opening large files
(setq large-file-warning-threshold nil)

;; The battle is long lost
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; Enable copy/past-ing from clipboard
(setq x-select-enable-clipboard t)

;; Fix weird color escape sequences
(setq system-uses-terminfo nil)

;; No yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; A nice line height
(setq-default line-spacing 1)

;; Highlight matching parens
(show-paren-mode 1)

;; SRGB support for OSX
(setq ns-use-srgb-colorspace t) 

;; Transparently open compressed files
(setq auto-compression-mode t)

;; Open splits horizontally
(setq split-height-threshold 0)
(setq split-width-threshold nil)

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; UTF-8
(setq locale-coding-system 'utf-8) 
(set-terminal-coding-system 'utf-8) 
(set-keyboard-coding-system 'utf-8) 
(set-selection-coding-system 'utf-8) 
(prefer-coding-system 'utf-8) 

;; Sentences do not need double spaces to end.
(set-default 'sentence-end-double-space nil)
;; No backups
(setq make-backup-files nil)

;; Define behaviour of home and end keys
;; Home = beginning of line or indent, End = end of lne
(defun my-smart-beginning-of-line ()
  "Move point to beginning-of-line. If repeat command it cycle
position between `back-to-indentation' and `beginning-of-line'."
  (interactive "^")
  (if (and (eq last-command 'my-smart-beginning-of-line)
           (= (line-beginning-position) (point)))
      (back-to-indentation)
    (beginning-of-line)))
(global-set-key [home]     'my-smart-beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

;; Don't modify logs
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-mode))

;; Frame titles
(setq-default frame-title-format '((:eval (if (buffer-file-name)
                                              (abbreviate-file-name (buffer-file-name)) "%f"))))
;; Delete selection mode
(delete-selection-mode 1)

;; Auto kill current buffer (don't prompt)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; Packages I use everywhere

(use-package diminish
  :ensure t)

;; Keep cursor away from edges when scrolling up/down
(use-package smooth-scrolling
  :ensure t
  :init
  (smooth-scrolling-mode t))

;; keybindings interactive help
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
    which-key-side-window-max-width 0.33
    which-key-idle-delay 0.05)
  :diminish which-key-mode)

;; Easier package upgrading
(use-package paradox
  :ensure t
  :commands (paradox-list-packages)
  :config
  (paradox-enable)
  (paradox-menu-mode))

(use-package restart-emacs
  :ensure t
  :commands (restart-emacs))

(eval-when-compile (require 'cl))
(defun ignore-error-wrapper (fn)
  "Function return new function that ignore errors.
   The function wraps a function with `ignore-errors' macro."
  (lexical-let ((fn fn))
    (lambda ()
      (interactive)
      (ignore-errors
        (funcall fn)))))

(global-set-key [s-left] (ignore-error-wrapper 'windmove-left))
(global-set-key [s-right] (ignore-error-wrapper 'windmove-right))
(global-set-key [s-up] (ignore-error-wrapper 'windmove-up))
(global-set-key [s-down] (ignore-error-wrapper 'windmove-down))
(provide 'emacs-general-defaults)
;;; emacs-general-defaults.el ends here
