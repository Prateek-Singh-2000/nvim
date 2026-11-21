;; extends

;; Strings
(string) @string.outer
(string_fragment) @string.inner
(template_string) @string.outer

;; Square brackets: outer = whole [ ... ]
(_ . "[" "]") @bracket.outer

;; Square brackets: inner = content between [ and ]
((_ . "[" "]") @bracket.inner
  (#inner-brackets! @bracket.inner))
