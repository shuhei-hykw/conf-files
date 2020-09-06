;;

; Author: Shuhei Hayakawa

;;______________________________________________________________________________
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(setq load-path
      (append '(
		;;"~/.emacs.d/"
		"~/.emacs.d/site-lisp"
		"~/.emacs.d/site-lisp/auto-install"
		"~/.emacs.d/site-lisp/emacs-bookmark-extension"
		"~/local/share/emacs/site-lisp/mew"
		"~/local/share/emacs/site-lisp/w3m"
		)
              load-path))
;; (setq hostname (downcase system-name))
;; (setq hostname (car (split-string hostname "\\.")))
;; (setq el (expand-file-name (concat "~/.emacs.d/mylisp_" hostname ".el" )))
;; (if (file-exists-p el)
;;     (load-file el))
;;(load-file "~/.emacs.d/mylisp.el")

;;===== Japanese =====
(set-language-environment 'Japanese)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
; kanji operation
;(setq default-input-method "japanese-egg-wnn")
;(setq default-input-method 'japanese-egg-anthy)
(defun euc () (interactive) (set-buffer-file-coding-system 'euc-jp-unix))
(defun jis () (interactive) (set-buffer-file-coding-system 'iso-2022-jp-unix))
(defun sjis () (interactive) (set-buffer-file-coding-system 'sjis-unix))
(defun dos () (interactive) (set-buffer-file-coding-system 'sjis-dos))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;===== conf =====
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))
(setq auto-save-default nil)
;(require 'uniquify)
;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(fset 'yes-or-no-p 'y-or-n-p)                    ; "yes or no" --> "y or n"
(setq require-final-newline t)

;;===== display =====
(setq mode-line-frame-identification " ")
;(tool-bar-mode -1)                              ; hide tool bar
(menu-bar-mode -1)                              ; hide menu bar
(line-number-mode t)                            ; show line number
(column-number-mode t)                          ; show column number
(setq display-time-string-forms                 ; show time
      '((format " %s/%s (%s)[%s:%s]"
                month day dayname
                24-hours minutes
                )))
(display-time)
;(which-function-mode 1)
(setq inhibit-startup-message t)                ; skip startup page
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;;===== color =====
;(global-font-lock-mode nil)                    ; stop color mode
(set-cursor-color "orange")                     ; only window mode
(show-paren-mode 1) ; matching brackets
(setq show-paren-style 'mixed)
;(when (boundp 'show-trailing-whitespace)       ; enphasize endline space
;  (setq-default show-trailing-whitespace t))
;(global-hl-line-mode)                          ; enphasize current line
;(setq-default transient-mark-mode t)           ; higlight selected region
;(set-face-foreground 'region "white")
;(set-face-background 'region "black")
;(set-face-foreground 'isearch "white")         ; highlight search results
;(set-face-background 'isearch "black")

;;===== key bindings =====
;(setq kill-whole-line t)                       ; C-k include newline
(global-unset-key [insert])
(global-unset-key [insertchar])
(defun other-window-backward ()
  "move to other window backward"
  (interactive)
  (other-window -1))
(global-set-key (kbd "C-\\") 'other-window)
(global-set-key (kbd "C-^") 'other-window-backward)
(global-set-key (kbd "M-r") 'replace-string)
(global-set-key (kbd "M-u") 'universal-argument)
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key "\C-x\C-e" 'eval-buffer)
(global-set-key "\C-z" 'suspend-frame)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-j") 'delete-char)
(define-key global-map (kbd "M-?") 'help-for-help)
;(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-c ;") 'comment-dwim)
(define-key minibuffer-local-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-map (kbd "C-n") 'next-history-element)
(define-key minibuffer-local-completion-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-completion-map (kbd "C-n") 'next-history-element)
(define-key minibuffer-local-ns-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-ns-map (kbd "C-n") 'next-history-element)
(define-key minibuffer-local-must-match-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-must-match-map (kbd "C-n") 'next-history-element)

;;========== for Mew Setting ==========
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))

(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;;===== dired =====
; mark
;; (define-key dired-mode-map " " 'dired-toggle-mark)
;; (defun dired-toggle-mark (arg)
;;   "Toggle the current (or next ARG) files."
;;   (interactive "P")
;;   (let ((dired-marker-char
;; 	 (if (save-excursion (beginning-of-line)
;; 			     (looking-at " "))
;; 	     dired-marker-char ?\040)))
;;     (dired-mark arg)
;;     (dired-previous-line 1)))
; color edited today
(defface my-face-f-2 '((t (:foreground "Yellow"))) nil)
(defvar my-face-f-2 'my-face-f-2)
(defun my-dired-today-search (arg)
  "Fontlock search function for dired."
  (search-forward-regexp
   (concat (format-time-string "%b %e" (current-time)) " [0-9]....") arg t))

(add-hook 'dired-mode-hook
          '(lambda ()
             (font-lock-add-keywords
              major-mode
              (list
               '(my-dired-today-search . my-face-f-2)
            ))))

;;===== time stamp =====
;; (setq time-stamp-start "date: ")
;; (setq time-stamp-format "%04y.%02m.%02d")
;; ;(setq time-stamp-format "%04y/%02m/%02d [%02H:%02M]")
;; ;(setq time-stamp-format "%04y-%02m/%02d"); [%02H:%02M]")
;; (setq time-stamp-end "$")
;; (setq time-stamp-line-limit 10)                  ; def=8
;; (if (not (memq 'time-stamp write-file-functions))
;;     (setq write-file-functions
;; 	  (cons 'time-stamp write-file-functions)))

(setq vc-handled-backends ())

;; for YML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;;===== highlight-indentation =====
(require 'highlight-indentation)

;; for python
(add-hook 'python-mode-hook
	  '(lambda ()
	     (setq python-indent 2)
	     (setq indent-tabs-mod nil)
	     ))

;; for json
(add-hook 'js-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(add-to-list 'load-path
      (expand-file-name "/usr/share/emacs/site-lisp/w3m"))

;; w3m
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

;; (use-package w3m-load)
;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (all markdown-preview-mode use-package markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; markdown
(setq markdown-command "github-markup")
(setq markdown-command-needs-filename t)
(use-package markdown-mode
         :commands (markdown-mode gfm-mode)
         :mode (("\\.md\\'" . gfm-mode)
            ("\\.markdown\\'" . gfm-mode))
         :config
         (setq
          markdown-command "github-markup"
          markdown-command-needs-filename t
          markdown-content-type "application/xhtml+xml"
          markdown-css-paths '("https://cdn.jsdelivr.net/npm/github-markdown-css/github-markdown.min.css")
          markdown-xhtml-header-content "
<style>
body {
  box-sizing: border-box;
  max-width: 740px;
  width: 100%;
  margin: 40px auto;
  padding: 0 10px;
}
</style>
<script>
document.addEventListener('DOMContentLoaded', () => {
  document.body.classList.add('markdown-body');
});
</script>
" ))
(autoload 'markdown-preview-mode "markdown-preview-mode.el" t)
