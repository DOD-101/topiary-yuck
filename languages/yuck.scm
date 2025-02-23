[
  (string_fragment)
  (comment)
] @leaf

[
  (comment)
] @prepend_space @append_hardline

[
  (comment)
  (list)
] @allow_blank_line_before

[
  "?"
  "!="
  "=="
  ">"
  "<"
  ">="
  "<="
  "+"
  "-"
  "*"
  "/"
  "%"
  "!"
  ":"
  "?:"
  "in"
] @prepend_space @append_space

[
  "for" @append_space
]

(list
  "(" @append_indent_start @prepend_hardline
)

(loop_widget
  "(" @append_indent_start
)

(list
  ")" @prepend_indent_end @prepend_antispace
)

(loop_widget
  ")" @prepend_indent_end @prepend_antispace
)

(array) @append_hardline

(array
  "[" @append_space
)

(array
  "]" @prepend_space
)

(symbol) @append_space

(keyword) @prepend_hardline @append_space

(
  (keyword) @do_nothing
  .
  (expr) @prepend_hardline
)

(ternary_expression
  ":" @prepend_spaced_softline
)

(ternary_expression
  "?" @prepend_spaced_softline
)

(expr
  "{" @append_indent_start @append_spaced_softline
)

(expr
  "}" @prepend_indent_end @prepend_spaced_softline
)

(list
  (keyword) ; to make it not apply to include statements
  [
    (keyword) @do_nothing
    (_)+
  ]
  .
  (_) @prepend_empty_softline
  .
)

(loop_widget
  "in"
  .
  [
    (symbol)
    (string)
  ] @append_hardline
)
