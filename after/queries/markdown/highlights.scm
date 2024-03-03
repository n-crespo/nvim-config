;; extends
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

((block_quote_marker)
 @markup.quote (#set! conceal "▏" ))

((block_continuation)
 @markup.quote (#set! conceal "▏" ))

; ((list_marker_dot)
;  @conceal (#set! conceal "•"))
