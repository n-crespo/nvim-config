;extends

; this breaks without that ^ (why? who knows)

; replace checkboxes with nice looking boxes
;
([
  (task_list_marker_checked)
  ] @markup.list.checked (#set! conceal "󰄲"))
  ; ] @markup.list.checked (#set! conceal ""))
([
  (task_list_marker_unchecked)
  ] @markup.list.unchecked (#set! conceal "󰄱"))

  ; ] @markup.list.unchecked (#set! conceal ""))

; this works but only for the first line of the block quote
; ((block_quote_marker)
;  @markup.quote (#set! conceal "▏" ))


; BUG: this breaks things (will hide indented/nested bullets)

; ((block_continuation) @markup.quote
;                       (#set! "priority" 0)
;                       (#set! conceal "▏" ))


;ALTERNATIVE CHARACTERS
;(#set! conceal "◾" ))
;; (#set! conceal "᛫" ))
;; (#set! conceal "‣" ))
;; (#set! conceal "・" ))
;(#set! conceal "•" ))
;

; ; if you want rounded bullet: replace conceal char with • and uncomment offset lines
; ([(list_marker_plus) (list_marker_star)]
;   @markup.list
;   ; (#offset! @markup.list 0 0 0 -1)
;   (#set! priority 1000)
;   (#set! conceal "○"))
; ([(list_marker_plus) (list_marker_star)]
;   @markup.list
;   (#any-of? @markup.list "+" "*")
;   (#set! conceal "○"))
; ((list_marker_minus)
;   @markup.list
;   ; (#offset! @markup.list 0 0 0 -1)
;   (#set! conceal "○"))
; ((list_marker_minus)
;   @markup.list
;   (#eq? @markup.list "-")
;   (#set! conceal "○"))

; (
;   ([
;     (list_marker_star)
;     (list_marker_plus)
;     (list_marker_minus)
;   ]) @markdown_list_marker
;   (#offset! @markdown_list_marker 0 0 0 -1)
;   (#set! conceal "◾")
; )
