(setq-default indent-tabs-mode t)
;;(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq ruby-indent-level 2)
(setq js-indent-level 2)
(setq css-indent-level 2)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
'(buffer-encoding (quote utf-8))
'(recentf-mode t)
'(transient-mark-mode t)


;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))


(setq vc-make-backup-files t)

(setq query-replace-highlight t)
(setq search-highlight t)
(setq font-lock-maximum-decoration t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq require-final-newline t)
(setq major-mode 'text-mode)

;; turn on paren matching
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; Get rid of the startup screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; Switch on desktop save mode
(desktop-save-mode 1)
(setq history-length 250)

(setq column-number-mode t)

(setq default-directory "~/workspace/indix")


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
;;(require 'package)
;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")
  ;;                       ("marmalade" . "http://marmalade-repo.org/packages/")
    ;;                     ("melpa" . "http://melpa.milkbox.net/packages/"))


(set-background-color "#2b2b2b")
(set-foreground-color "white")
(set-face-background 'modeline "DarkRed")
(set-face-foreground 'modeline "white")
;; color-theme
;;(add-to-list  'load-path "~/.emacs.d/plugins/color-theme")
;;(require 'color-theme)
;;   (color-theme-initialize)
;;   (color-theme-arjen)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)



;; javascript
;;(add-to-list  'load-path "~/.emacs.d/plugins/javascript")
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)



;; ruby electric
(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))
(setq hippie-expand-try-functions-list
     '(try-complete-abbrev
   try-complete-file-name
   try-expand-dabbrev))


;; yaml
;;(add-to-list 'load-path "~/.emacs.d/plugins/yaml-mode")
;;(require 'yaml-mode)
;;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;(add-to-list 'load-path "~/.emacs.d/plugins/others")

(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer."
  (interactive))

(global-set-key "\M-\C-y" 'kill-ring-search)

;;Copy Paste between emacs and other X apps

(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)



;; Kill all but current buffer
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))


(setq rinari-tags-file-name "TAGS")

 ; When Rinari mode is loaded, add extra bindings to its key map enabling the
  ; use of M-R and M-r as its prefixes. The easier to type M-r is used for the
  ; frequently used `find' functions and M-R is used for the more infrequently
  ; used rake/script/web-server commands. M-r is normally bound to
  ; `move-to-window-line-top-bottom', which I can do without, and M-R is
  ; normally unbound. Examples of the changes below; it should be obvious how to
  ; pick your own prefixes if you don't like mine.
  ;
  ; Function                  Default Binding    New Binding
  ; ========                  ===============    ===========
  ; rinari-find-controller    C-c ; f c          M-r c
  ; rinari-web-server         C-c ; w            M-R w
  (add-hook 'rinari-minor-mode-hook (lambda ()
	(define-prefix-command 'pd-rinari-map1)
	(define-prefix-command 'pd-rinari-map2)
	(local-set-key (kbd "M-R") 'pd-rinari-map1)
	(local-set-key (kbd "M-r") 'pd-rinari-map2)

	(define-key pd-rinari-map1 "'" 'rinari-find-by-context)
	(define-key pd-rinari-map1 ";" 'rinari-find-by-context)
	(define-key pd-rinari-map1 "c" 'rinari-console)
	(define-key pd-rinari-map1 "d" 'rinari-cap)
	(define-key pd-rinari-map1 "e" 'rinari-insert-erb-skeleton)
	(define-key pd-rinari-map1 "g" 'rinari-rgrep)
	(define-key pd-rinari-map1 "p" 'rinari-goto-partial)
	(define-key pd-rinari-map1 "q" 'rinari-sql)
	(define-key pd-rinari-map1 "r" 'rinari-rake)
	(define-key pd-rinari-map1 "s" 'rinari-script)
	(define-key pd-rinari-map1 "t" 'rinari-test)
	(define-key pd-rinari-map1 "w" 'rinari-web-server)
	(define-key pd-rinari-map1 "x" 'rinari-extract-partial)

	(define-key pd-rinari-map2 ";" 'rinari-find-by-context)
	(define-key pd-rinari-map2 "C" 'rinari-find-cells)
	(define-key pd-rinari-map2 "F" 'rinari-find-features)
	(define-key pd-rinari-map2 "M" 'rinari-find-mailer)
	(define-key pd-rinari-map2 "S" 'rinari-find-steps)
	(define-key pd-rinari-map2 "Y" 'rinari-find-sass)
	(define-key pd-rinari-map2 "a" 'rinari-find-application)
	(define-key pd-rinari-map2 "c" 'rinari-find-controller)
	(define-key pd-rinari-map2 "e" 'rinari-find-environment)
	(define-key pd-rinari-map2 "f" 'rinari-find-file-in-project)
	(define-key pd-rinari-map2 "h" 'rinari-find-helper)
	(define-key pd-rinari-map2 "i" 'rinari-find-migration)
	(define-key pd-rinari-map2 "j" 'rinari-find-javascript)
	(define-key pd-rinari-map2 "l" 'rinari-find-lib)
	(define-key pd-rinari-map2 "m" 'rinari-find-model)
	(define-key pd-rinari-map2 "n" 'rinari-find-configuration)
	(define-key pd-rinari-map2 "o" 'rinari-find-log)
	(define-key pd-rinari-map2 "p" 'rinari-find-public)
	(define-key pd-rinari-map2 "r" 'rinari-find-rspec)
	(define-key pd-rinari-map2 "s" 'rinari-find-script)
	(define-key pd-rinari-map2 "t" 'rinari-find-test)
	(define-key pd-rinari-map2 "u" 'rinari-find-plugin)
	(define-key pd-rinari-map2 "v" 'rinari-find-view)
	(define-key pd-rinari-map2 "w" 'rinari-find-worker)
	(define-key pd-rinari-map2 "x" 'rinari-find-fixture)
	(define-key pd-rinari-map2 "y" 'rinari-find-stylesheet)
	(define-key pd-rinari-map2 "z" 'rinari-find-rspec-fixture)
	))
