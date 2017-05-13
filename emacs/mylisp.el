;============================
;         mylisp.el
; update: 2013/10/11 [17:59]
;============================

;--- auto-install ---
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/lisp/auto-install/")
;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;--- zone ---
;(require 'zone)
;(zone-when-idle 300) ; [s]
;--- auto-save-buffers ---
(require 'auto-save-buffers)
(run-with-idle-timer 5 t 'auto-save-buffers) ; [s]
;(require 'pc-bufsw)

;--- ibuffer ---
;(require 'ibuffer)
;(global-set-key (kbd "C-x ;") 'ibuffer)
;(setq ibuffer-user-other-window t)

; format
;(setq ibuffer-formats '(
;			(mark modified read-only
;			      " " (name   20 -1 :left)
;			      " " (coding 13 13 :left)
;			      " " (size    6 -1 :right)
;			      " " (mode   16 16 :left)
;			      " " filename)
;			(mark
;			 " " (name   35 -1 :left)
;			 " " (coding 13 13 :left)
;			 " " filename)))
;(define-ibuffer-column
;  coding
;  (:name " Coding ")
;  (if (coding-system-get buffer-file-coding-system 'mime-charset)
;      (format " %s" (coding-system-get buffer-file-coding-system 'mime-charset))
;    " undefined"
;    )
;  )
;(setq ibuffer-saved-filter-groups
;      '(
;	("default"
;         ("Code : C/C++/C#" (or
;;			     (mode . c++-mode)
;			     (mode . c-mode)
;			     (mode . csharp-mode)
;			     ))
;	 ("Code : lisp" (or
;			 (mode . lisp-mode)
;			 (mode . emacs-lisp-mode)
;			 ))
;	 ("Code : Java" (mode . java-mode))
 ;        ("Makefile" (or
  ;                    (mode . makefile-automake-mode)
   ;                   (mode . makefile-bsdmake-mode)
;                      (mode . makefile-gmake-mode)
;                      (mode . makefile-imake-mode)
;                      (mode . makefile-makepp-mode)
;                      (mode . makefile-mode)
;                      ))
;         ("Dired" (mode . dired-mode))
	 ;; ("emacs-config" (or
         ;;               (filename . ".emacs.d")
         ;;               (filename . "emacs-config")
         ;;               ))
;         ("Web Dev" (or
;                     (mode . html-mode)
;                     (mode . css-mode)
;                     ))
;	 ("Subversion" (name . "\*svn"))
;         ("Magit" (name . "\*magit"));
;	 ("Default : Emacs" (name . "\*.*\*$"))
         ;; ("Help" (or
         ;;       (name . "\*Help\*")
         ;;       (name . "\*Apropos\*")
         ;;       (name . "\*info\*")
         ;;       ))
;         )
;        )
;      )
;(setq ibuffer-show-empty-filter-groups nil)
;(add-hook 'ibuffer-mode-hooks
;          '(lambda ()
;             ;; buffer list auto up to date;
;	     (ibuffer-auto-mode 1)
             ;; filter groups
;             (ibuffer-switch-to-saved-filter-groups "default")
;             )
;          )
;(setq ibuffer-never-show-regexps '("messages"))

; scroll
;(defun ibuffer-visit-buffer-other-window-scroll (&optional down)
;  (interactive)
;  (let ((buf (ibuffer-current-buffer)))
;    (when (and buf (buffer-live-p buf))
;      (if (string=
;           (buffer-name (window-buffer (next-window)))
;           (buffer-name buf))
;          (if down
;              (scroll-other-window-down nil)
;            (scroll-other-window))
;        (ibuffer-visit-buffer-other-window-noselect))
;      (if (eq major-mode 'ibuffer-mode)
;          ()
;        (setq buf (current-buffer))
;        (switch-to-buffer (get-buffer "*Ibuffer*"))
;        ))))
;(defun ibuffer-visit-buffer-other-window-scroll-down ()
;  (interactive)
;  (ibuffer-visit-buffer-other-window-scroll t))
;(define-key ibuffer-mode-map " " 'ibuffer-visit-buffer-other-window-scroll)
;(define-key ibuffer-mode-map "b" 'ibuffer-visit-buffer-other-window-scroll-down)
; n,p
;(defadvice ibuffer-forward-line
;  (after ibuffer-scroll-page activate)
;  (ibuffer-visit-buffer-other-window-scroll))
;(defadvice ibuffer-backward-line
;  (after ibuffer-scroll-page-down activate)
;  (ibuffer-visit-buffer-other-window-scroll-down))
; sort
;(define-ibuffer-sorter ext
;  "Sort the buffers by file name extension.
;Ordering is lexicographic."
;  (:description "ext")
;  (let* ((a (car a)) (b (car b))
;         (fa (buffer-file-name a)) (fb (buffer-file-name b))
;         (ea (and fa (file-name-extension fa))) (eb (and fb (file-name-extension fb)))
;         (na (buffer-name a)) (nb (buffer-name b))
;         (list (list (cons ea eb) (cons fa fb) (cons na nb)))
;         (cmp 0))
;    (while (and list (= cmp 0))
;      (let ((a (caar list)) (b (cdar list)))
;        (setq cmp (cond ((and a b)
;                         (cond ((string= (downcase a) (downcase b)) 0)
;                               ((string-lessp (downcase a) (downcase b)) -1)
;                               (t 1)))
;                        (a -1) (b 1) (t 0))
;              list (cdr list))))
;    (< cmp 0)))
; sort key --- "s RET" = sort, "/ RET" = filter
;(defun ibuffer-select-sorting-mode ()
;  "Select sorting mode with completion."
;  (interactive)
;  (setq ibuffer-sorting-mode;
;	(intern (completing-read "mode: " (cons (list 'recency) ibuffer-sorting-functions-alist) nil t));)
;  (message "Sorting by %s" ibuffer-sorting-mode)
;  (ibuffer-redisplay t))
;(defun ibuffer-select-filter ()
 ; "Select filter with completion."
;  (interactive)
;  (let ((filter;
;	  (completing-read "filter: " ibuffer-filtering-alist nil t)))
;    (message "Filtering by %s" filter)
;    (call-interactively (intern (concat "ibuffer-filter-by-" filter)))))
;(define-key ibuffer-mode-map (kbd "s RET") 'ibuffer-select-sorting-mode)
;(define-key ibuffer-mode-map (kbd "/ RET") 'ibuffer-select-filter)

;--- anything.el ---
;; (require 'anything)
;; (require 'anything-config)
;; (setq anything-sources
;;       (list anything-c-source-buffers
;;             anything-c-source-bookmarks
;;             anything-c-source-file-name-history
;;             anything-c-source-man-pages
;;             anything-c-source-info-pages
;;             anything-c-source-calculation-result
;;             anything-c-source-locate))
;; (global-set-key (kbd "C-x b") 'anything)

;--- tempbuf.el ---
(require 'tempbuf)
(setq tempbuf-life-extension-ratio 0
      tempbuf-minimum-timeout 1)
(add-hook 'compilation-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'completion-list-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'view-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;--- bookmark-extensions ---
(require 'bookmark-extensions)
(set-face-foreground 'bmkext-local-directory
                     (face-foreground font-lock-function-name-face))
(set-face-background 'bmkext-local-directory
                     "black")
(set-face-foreground 'bmkext-local-file
                     (face-foreground font-lock-variable-name-face))

;--- w3m ---
;(require 'w3m-load)
;(setq browse-url-browser-function 'w3m-browse-url)


;--- multi-term ---
;; (require 'multi-term)
;; (setq multi-term-program "/bin/bash")
;; (add-hook 'term-mode-hook
;;          '(lambda ()
;;             (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
;;             (define-key term-raw-map (kbd "C-y") 'term-paste)
;;             ))
;; (global-set-key (kbd "C-c t") '(lambda ()
;;                                 (interactive)
;;                                 (multi-term)))

;--- sdic ---
;(when (require 'sdic nil t)
;  (global-set-key "\C-c\C-d" 'sdic))

;--- skype ---
;; (defun my-skype ()
;;   (interactive)
;;   (require 'skype)
;;   (setq skype--my-user-handle "ID")
;;   (skype--init)
;;   (skype--open-all-users-buffer-command))

;--- other lisps ---
(require 'twiddle)
(twiddle-start)
(load "emvaders")
(load "setnu")
(load "setnu+")
(autoload 'tetris "tetris" "tetris game" t nil)

;--- display setting ---
;(split-window-horizontally)
;(list-buffers)
;(split-window-vertically)
;(enlarge-window 10)
;(enlarge-window-horizontally 18)
;(other-window -1)
;(mew)
;(other-window -1)
;(other-window 1)
;(ibuffer)
;(other-window -1)
;(eshell)

;;; Local Variables: 
;;; after-save-hook: (lambda () (byte-compile-file (buffer-file-name)))
;;; End:
