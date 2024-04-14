;; Make emacs startup faster
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; Silecnes compler warnings for nativecomp
(setq comp-async-report-warnings-errors nil) 
(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
 
(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))
 
(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
    gc-cons-percentage 0.1))
 
(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;

;; Initialize melpa repo
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
        '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Load Witchmacs theme
(load-theme 'Witchmacs t)

;; Load config.org for init.el configuration
(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.config/emacs/config.org")))
(keymap-global-set "C-c r" 'config-reload)
(config-reload)

;; Opens config.org for editing
(defun config-open ()
  (interactive)
  (find-file "~/.config/emacs/config.org"))
(keymap-global-set "C-c e" 'config-open)

;; Opens dashboard upon new emacsclient


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eglot-ignored-server-capabilities '(:inlayHintProvider))
 '(evil-undo-system 'undo-tree)
 '(global-undo-tree-mode t)
 '(haskell-interactive-popup-errors nil)
 '(lsp-inlay-hint-enable nil)
 '(package-selected-packages
   '(lsp-mode dashboard rustic evil-numbers evil-collection haskell-mode org-superstar org-superstar-mode meghanada company-irony company-c-headers company magit treemacs-icons-dired treemacs-evil treemacs undo-tree page-break-lines async ido-vertical-mode switch-window avy beacon evil swiper which-key spaceline diminish auto-package-update htmlize))
 '(undo-tree-auto-save-history nil)
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#262626" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 150 :width normal :foundry "1ASC" :family "Iosevka"))))
 '(flymake-error ((t (:underline "red"))))
 '(haskell-error-face ((t (:underline "#dc322f")))))
