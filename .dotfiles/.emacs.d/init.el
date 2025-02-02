(setq inhibit-startup-message t)
(setq scroll-margin 5
      scroll-step 1
      scroll-conservatively 1000)
(put 'suspend-frame 'disabled t)

(global-display-line-numbers-mode 1)
(load-theme 'modus-vivendi t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(hl-line-mode 1)
(blink-cursor-mode -1)
(indent-tabs-mode -1)
(global-prettify-symbols-mode 1)

(global-whitespace-mode 1)
;; Don't enable whitespace for.
(setq-default whitespace-global-modes
              '(not shell-mode
                    help-mode
                    magit-mode
                    magit-diff-mode
                    ibuffer-mode
                    dired-mode
                    occur-mode))
;; Set whitespace actions.
(setq-default whitespace-action
              '(cleanup auto-cleanup))
(setq-default whitespace-style
              '(face spaces empty tabs newline trailing space-mark tab-mark))
;; Make these characters represent whitespace.
(setq-default whitespace-display-mappings
      '(
        ;; space -> · else .
        (space-mark 32 [183] [46])
        ;; new line -> ¬ else $
        (newline-mark ?\n [172 ?\n] [36 ?\n])
        ;; tabs -> » else >
        (tab-mark ?\t [187 ?\t] [62 ?\t])))
;; Whitespace color corrections.
(set-face-background whitespace-space "black")
(set-face-foreground whitespace-space "color-236")

(helm-mode 1)
(setq completion-styles '(flex))
(global-set-key ( kbd "C-x C-f" )  'helm-find-files)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(haskell-mode nix-mode lsp-mode helm go-mode)))
(package-initialize)

; tree-sitter
(require 'tree-sitter)
(require 'tree-sitter-langs)
(require 'tree-sitter-indent)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)


; LSP
(require 'lsp-mode)

; Go
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook 'lsp-deferred)

; Nix
(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

; Hare
(add-to-list 'load-path "~/Programming/hare/hare-mode")
(autoload 'hare-mode "hare-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.ha\\'" . hare-mode))

; Haskell

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Gleam

(use-package gleam-mode
  :load-path "./gleam-mode")
(add-hook 'gleam-mode-hook
          (lambda () (add-hook 'before-save-hook 'gleam-format nil t)))
