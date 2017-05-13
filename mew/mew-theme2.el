;============================
;       .mew-theme.el
; update: 2013/10/05 [16:48]
;============================

;--- Highlight header ---
(mew-setface-bold header-subject
		  :tty "magenta" :light "Firebrick" :dark "OrangeRed")
(mew-setface-bold header-from
		  :tty "green" :light "DarkOrange4" :dark "Gold")
(mew-setface-bold header-date
		  :tty "none" :light "ForestGreen" :dark "LimeGreen")
(mew-setface-bold header-to
		  :tty "blue" :light "DarkViolet" :dark "violet")
(mew-setface-bold header-key
		  :tty "none" :light "ForestGreen" :dark "LimeGreen")
(mew-setface header-private)
;; (mew-setface-bold header-private)
(mew-setface-bold header-important
		  :tty "cyan" :light "MediumBlue" :dark "SkyBlue")
(mew-setface-bold header-marginal
		  :light "none" :dark "gray50")
(mew-setface-bold header-warning
		  :tty "red" :light "red" :dark "red")
(mew-setface-bold header-xmew
		  :tty "none" :light "chocolate" :dark"chocolate")
(mew-setface-bold header-xmew-bad
		  :tty "red" :light "red" :dark "red")
(mew-header-color "X-Greylist:" "none")

;--- Highlight body ---
(mew-setface body-url
	     :tty "red" :light "Firebrick" :dark "OrangeRed")
(mew-setface body-comment
	     :tty "blue" :light "gray50" :dark "gray50")
(mew-setface body-cite1
	     :tty "green" :light "ForestGreen" :dark "LimeGreen")
(mew-setface body-cite2
	     :tty "cyan" :light "MediumBlue" :dark "SkyBlue")
(mew-setface body-cite3
	     :tty "magenta" :light "DarkViolet" :dark "violet")
(mew-setface body-cite4
	     :tty "yellow" :light "DarkOrange4" :dark "Gold")
(mew-setface body-cite5
	     :tty "red" :light "Firebrick" :dark "OrangeRed")

;--- Highlight mark ---
(mew-setface mark-review
	     :tty "cyan" :light "MediumBlue" :dark "SkyBlue")
(mew-setface mark-escape
	     :tty "magenta" :light "DarkViolet" :dark "violet")
(mew-setface mark-delete
	     :tty "red" :light "Firebrick" :dark "OrangeRed")
(mew-setface mark-unlink
	     :tty "yellow" :light "DarkOrange4" :dark "Gold")
(mew-setface mark-refile
	     :tty "green" :light "ForestGreen" :dark "LimeGreen")
(mew-setface mark-unread
	     )

;--- Highlight eof ---
(mew-setface-bold eof-message
		  :tty "none" :light "ForestGreen" :dark "LimeGreen")
(mew-setface-bold eof-part
		  :tty "none" :light "DarkOrange4" :dark "Gold")
