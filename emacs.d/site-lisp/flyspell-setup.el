;;; package --- Summary: flyspell setup"
;;; Commentary:
;;; Code:

;; Pretty standard flyspell setup. Use aspell, with GB dictionary, and store
;; personal dictionary in ~/.emacs.d
(use-package flyspell
  :ensure t
  :delight
  :hook ((prog-mode . flyspell-prog-mode)
         (text-mode . flyspell-mode))
  :custom
  (flyspell-issue-message-flg nil)

  :config
  (setq ispell-program-name "aspell" ; use aspell instead of ispell
        ispell-dictionary "en_GB"
        ispell-silently-savep t
        ispell-personal-dictionary "~/.emacs.d/.aspell.en.pws"
        ispell-extra-args '("--sug-mode=ultra")))

(provide 'flyspell-setup)
;;; flyspell-setup.el ends here
