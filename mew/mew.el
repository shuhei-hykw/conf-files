;============================
;          .mew.el
; update: 2017.05.14
;============================

(setq mew-config-alist
      '(
 	(default ;;default account
	  (name               "Shuhei HAYAKAWA") ;; (user-full-name)
	  (user               "shuhei") ;; (user-login-name)
	  (mail-domain        "km.phys.sci.osaka-u.ac.jp")
	  (mail-address-list  "shuhei@km.phys.sci.osaka-u.ac.jp")
	  (ssl-verify-level 0)
	  ;--- SMTP
	  (smtp-server        "kmpc5.phys.sci.osaka-u.ac.jp")
	  ;;(smtp-server        "kmimap")
	  ;; (smtp-server        "kmhome")
	  (smtp-port          "submission") ;; 587
	  (smtp-ssl t)
	  (smtp-ssl-port      "submission")
	  (use-smtp-auth      t)
	  (smtp-auth-list     "PLAIN"); "CRAM-MD5"))
	  ;--- POP
	  ;; (pop-user           "shuhei")
	  ;; (pop-server         "kmimap")
	  ;; ;; (pop-server         "kmhome")
	  ;; (pop-auth           pass) ;; pass:pop apop,  t:sasl
	  ;; (pop-delete         nil) ;; t:delete,  nil:conserve
	  ;; (pop-size           0)
	  ;--- IMAP
	  (proto              "%")
	  (inbox-folder       "%inbox")
	  (imap-user          "shuhei")
	  (imap-server        "kmpc5.phys.sci.osaka-u.ac.jp")
	  ;;(imap-server        "kmimap")
	  (imap-ssl           t)
	  (imap-ssl-port      "993")
	  ;; (imap-auth-list     ("LOGIN" "CRAM-MD5"))
	  ;; (imap-auth          t)
	  (imap-delete        nil)
	  (imap-size          0)
	  (mailbox-type       imap)
	  ;--- NNTP
	  ;; (nntp-user "your NNTP account")
	  ;; (nntp-server "your NNTP server")
	  )
	;--- more account
	))
; To use local mailbox "mbox" or "maildir" instead of POP
;(setq mew-mailbox-type 'mbox)
;(setq mew-mbox-command "incm")
;(setq mew-mbox-command-arg "-u -d /path/to/mbox")
; If /path/to/mbox is a file, it means "mbox".
; If /path/to/mbox is a directory, it means "maildir".
(setq mew-imap-draft-folder "%draft")
(setq mew-imap-queue-folder "%queue")
(setq mew-imap-trash-folder "%trash")
(setq mew-auto-get t)
;(setq mew-auto-get nil)
;;;
;(setq mew-use-master-passwd t)
;; (load-file "~/.emacs.d/my-mew-passwd.el")

;========== display ==========
;--- use unicode
;(require 'un-define)
(set-language-environment "Japanese")
;(prefer-coding-system 'iso-2022-jp)
;(prefer-coding-system 'shift_jis)
;(prefer-coding-system 'euc-jp)
(prefer-coding-system 'utf-8)
;--- color
;(setq mew-use-highlight-header nil)
; summary mode
(setq mew-summary-form-mark-delete t)
(defun mew-summary-form-num () (MEW-NUM))
(defun mew-summary-form-youbi ()
  (let ((s (MEW-DATE)))
    (if (>= (length s) 3) (setq s (substring s 0 3)))
    (cond
     ((string= s "Mon") "月")
     ((string= s "Tue") "火")
     ((string= s "Wed") "水")
     ((string= s "Thu") "木")
     ((string= s "Fri") "金")
     ((string= s "Sat") "土")
     ((string= s "Sun") "日")
     (t "??"))))
(setq mew-summary-form
      `((-4 num) " " type (-2 year) "/" (5 date) "("
	(2 youbi) ")[" (-5 time) "] " (14 from) "  "
	t (0 subj)
	))
;--- fancy-thread
(setq mew-use-fancy-thread t)
;--- mew-lang-jp sets this
(setq mew-fancy-thread-indent-strings
      [" +" " +" " |" "  "])
;;["├" "└" "│" "　"])
(setq mew-use-thread-separator nil)
(setq mew-thread-separator "--")
(setq mew-use-unread-mark t) ;; unread-mark U

;========== citation tip ==========
(setq mew-cite-fields
      '("From:" "Subject:" "Date:" ))
					;"Message-ID:"))
(setq mew-cite-format
      "\n
----- Original Message -----
From: %s
Subject: %s
Date: %s
\n")
					;Message-ID: %s\n\n")
;(setq mew-cite-prefix-function 'mew-cite-prefix-username)
(setq mew-cite-prefix-function nil)
;(setq mew-cite-prefix "> ")
;(setq mew-addrbook-for-cite-label 'nickname)
;(setq mew-addrbook-for-cite-prefix 'nickname)

;========== omit some fields in forwarding ==========
(setq mew-field-delete-for-forwarding
      '("Delivered-To:" "Message-Id:" "In-Reply-To:"
	"Lines:" "List-.+:" "Precedence:" "Received:"
	"References:" "Return-Path:" "Status:" "X-.+:"))

;========== using "w3m" with "emacs-w3m" ==========
;; (require 'mew-w3m)
;; (setq mew-mime-multipart-alternative-list
;;       '("Text/Plain" "Text/Html" "*."))
;; ;(setq mew-prog-html '(mew-mime-text/html-w3m nil nil))
;; (setq mew-use-w3m-minor-mode t)
;; (add-hook 'mew-message-hook 'mew-w3m-minor-mode-setter)

;========== using OpenOffice.org (openoffice) ==========
;(setq mew-prog-msword '("openoffice" nil t))
;(setq mew-prog-msexcel '("openoffice" nil t))
;(setq mew-prog-mspowerpoint '("openoffice" nil t))
(setq mew-prog-msword '("openoffice.org" nil t))
(setq mew-prog-msexcel '("openoffice.org" nil t))
(setq mew-prog-mspowerpoint '("openoffice.org" nil t))

;========== other programs ==========
;;(setq mew-prog-pdf '("xpdf" ("-geometry" "+0+0") t))
(setq mew-prog-pdf "acroread")
(setq mew-prog-rtf "openoffice.org")
;;(setq mew-prog-mstnef "ktnef")

;========== Local addition ==========
(setq mew-fcc "%sent") ; folder for sent mail
;(setq mew-fcc "+sent") ; folder for sent mail
(setq mew-dcc "shuhei@km.phys.sci.osaka-u.ac.jp") ; send myself secretly
(setq mew-reply-to "shuhei@km.phys.sci.osaka-u.ac.jp")
(setq mew-organization "Osaka University")
;--- remember password
(setq mew-use-cached-passwd t)  ; t or nil
(setq mew-passwd-time-unit 10)  ; unit is 10 minutes
(setq mew-passwd-lifetime 60)   ; multiply 60 (10x60=600m=10h)
;--- biff
(setq mew-use-biff t)
(setq mew-use-biff-bell t)
(setq mew-biff-interval 1) ; mitute
;--- print mail contents
(setq mew-print-command-format
      "nkf -e | \lpr -o Pagesize=A4 -Pshuhei_mono")
(defun mew-print-region (begin end)
  (interactive "r")
  (shell-command-on-region begin end mew-print-command-format))
(defun mew-print-buffer ()
  (interactive)
  (mew-print-region (point-min) (point-max)))
(setq mew-print-function (function mew-print-buffer))
;--- distinguish safe and warn domains
(setq mew-safe-domains
      '("km.phys.sci.osaka-u.ac.jp"
	"phys.sci.osaka-u.ac.jp"
	"hep.sci.osaka-u.ac.jp"
	"lns.sci.osaka-u.ac.jp"
	"gmail.com"
	"isc.osakac.ac.jp"
	"rcnp.osaka-u.ac.jp"
	))
(setq mew-warn-addresses
      '("all@phys.sci.osaka-u.ac.jp"
	"dcstudent-all@phys.sci.osaka-u.ac.jp"
	"mcstudent-all@phys.sci.osaka-u.ac.jp"
	"b4student-phys@phys.sci.osaka-u.ac.jp"
	))

;========== grep redefinition for SPAM filter ==========
;(setq mew-prog-grep "grep") ;; `C-u ?'
;(setq mew-prog-grep-opts '("-l" "-e")) ;; '("-e" "-l") is bad
(setq mew-prog-grep "bogo") ;; `C-u ?'
(setq mew-prog-grep-opts nil) ;; '("-e" "-l") is bad

;========== Manual refile list for SPAM ==========
(setq mew-refile-ctrl-multi nil)
(setq mew-refile-guess-control
      '(mew-refile-guess-by-alist
	mew-refile-ctrl-throw
	mew-refile-ctrl-auto-boundary
	mew-refile-guess-by-thread
	mew-refile-ctrl-throw
	mew-refile-guess-by-newsgroups
	mew-refile-guess-by-folder
	mew-refile-ctrl-throw
	mew-refile-guess-by-from-folder
	mew-refile-ctrl-throw
	mew-refile-guess-by-from
	mew-refile-ctrl-throw
	mew-refile-guess-by-default
	))

;========== mew-theme ==========
(if (fboundp 'mew-setface-bold)
    (setq mew-theme-file "~/.mew-theme2.el")); for mew version 6 or later

;==========
;  EOF
