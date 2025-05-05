-- ===============================================================
--  Simple objdump syntax for Neovim (Lua wrapper around :syntax)
-- ===============================================================

vim.cmd([[
  "──── guard ────
  if exists('b:current_syntax')
    finish
  endif

  "──── base asm colours ────
  runtime! syntax/asm.vim
  unlet b:current_syntax

  "──── optional embedded C (for objdump -S) ────
  syntax include @C syntax/c.vim
  unlet b:current_syntax

  "C source lines (start with letter/underscore)
  syntax region odCLine start=/^\h/ end=/$/ keepend contains=@C

  "──── disassembly line ────
  "address  [opcode bytes]  mnemonic  ...
  syntax region odHead start=+^\s*\x\+\%(\s\|:\)\++ end=+$+ keepend contains=odHex,odMnemonic

  "hex blobs in odHead
  syntax match odHex /\<\x\+\>/ contained

  "mnemonic = first word after one‑or‑more “xx ” opcode pairs
  syntax match odMnemonic /\%(\x\{2}\s\+\)\+\zs\h\w*/ contained

  "──── comments ( ; or # to end‑of‑line ) ────
  syntax match odComment /[;#].*$/ contained containedin=odHead

  "──── colour links ────
  highlight default link odComment Comment
  highlight default link odHex      Statement
  highlight default link odMnemonic Function

  let b:current_syntax = 'objdump'
]])
