; extends
; (list
;    (list_item
;    (list_marker_minus) @conceal (#set! conceal "")
;     (task_list_marker_checked)
;  ))
;
;  (list
;   (list_item
;     (list_marker_minus) @conceal (#set! conceal "")
;     (task_list_marker_unchecked)
;  ))

([
  (task_list_marker_checked)
  ] @markup.list.checked (#set! conceal "󰄲"))

([
  (task_list_marker_unchecked)
  ] @markup.list.unchecked (#set! conceal ""))

; ((block_quote_marker)
;  @markup.quote (#set! conceal "▏" ))


; ((block_continuation) @markup.quote
;                       (#set! "priority" 0)
;                       (#set! conceal "▏" ))

; ((list_marker_minus) @markup.list
;                      (#set! conceal "◾" ))
;                      ; (#set! conceal "᛫" ))
;                      ; (#set! conceal "‣" ))
;                      ; (#set! conceal "・" ))
;                      (#set! conceal "•" ))
;
; ((list_marker_minus) @markup.list
;                       (#set! conceal ""))


; ([(list_marker_plus) (list_marker_star)]
;   @markup.list
;   (#offset! @markup.list 0 0 0 -1)
;   (#set! priority 1000)
;   (#set! conceal "•"))
; ([(list_marker_plus) (list_marker_star)]
;   @markup.list
;   (#any-of? @markup.list "+" "*")
;   (#set! conceal "•"))
((list_marker_minus)
  @markup.list
  (#offset! @markup.list 0 0 0 -1)
  (#set! conceal "•"))
((list_marker_minus)
  @markup.list
  (#eq? @markup.list "-")
  (#set! conceal "•"))
