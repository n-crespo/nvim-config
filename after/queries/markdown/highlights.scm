;; extends
(list
   (list_item
   (list_marker_minus) @conceal (#set! conceal "")
    (task_list_marker_checked)
 )) 

 (list
  (list_item
    (list_marker_minus) @conceal (#set! conceal "")
    (task_list_marker_unchecked)
 )) 

 ([
  (task_list_marker_checked)
 ] @conceal (#set! conceal "󰄲"))

 ([
   (task_list_marker_unchecked)
 ] @conceal (#set! conceal ""))

((block_quote_marker)
 @markup.quote (#set! conceal "▏" ))

((block_continuation)
 @markup.quote (#set! conceal "▏" ))
