;extends

; replace checkboxes with nice looking boxes
([
  (task_list_marker_checked)
  ] @markup.list.checked (#set! conceal "󰄲"))
([
  (task_list_marker_unchecked)
  ] @markup.list.unchecked (#set! conceal "󰄱"))


;ALTERNATIVE CHARACTERS
; ◾
; ᛫
; ‣
; ・
; •

; if you want rounded bullet: replace conceal char with • and uncomment offset lines
; ([(list_marker_plus) (list_marker_star)]
;   @markup.list
;   ; (#offset! @markup.list 0 0 0 -1)
;   (#set! priority 1000)
;   (#set! conceal "◾"))
; ([(list_marker_plus) (list_marker_star)]
;   @markup.list
;   (#any-of? @markup.list "+" "*")
;   (#set! conceal "◾"))
; ((list_marker_minus)
;   @markup.list
;   ; (#offset! @markup.list 0 0 0 -1)
;   (#set! conceal "◾"))
; ((list_marker_minus)
;   @markup.list
;   (#eq? @markup.list "-")
;   (#set! conceal "◾"))
;
