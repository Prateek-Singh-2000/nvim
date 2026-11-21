;; extends

;; Strings
(string) @string.outer
(string_content) @string.inner

;; Square brackets: outer = whole [ ... ]
(_ . "[" "]") @bracket.outer

;; Square brackets: inner = content between [ and ]
((_ . "[" "]") @bracket.inner
  (#inner-brackets! @bracket.inner))
