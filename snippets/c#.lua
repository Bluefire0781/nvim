local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node -- For placeholders

ls.add_snippets("cs", {
  -- Function (Method)
  s("~func", {
    t({"public void "}), i(1, "MethodName"), t({"() {", "  "}), i(2, "// TODO"), t({"", "}"}),
  }),

  -- Main Method
  s("~main", {
    t({
      "using System;",
      "",
      "class Program {",
      "  static void Main() {",
      "    " }), i(1, "// Code here"), t({"",
      "  }",
      "}",
    }),
  }),

  -- Console WriteLine
  s("~cw", {
    t('Console.WriteLine("'), i(1, "Hello, World!"), t('");'),
  }),

  -- For Loop
  s("~for", {
    t({"for (int i = 0; i < "}), i(1, "// codition"), t({"; i++) {", "  "}), i(2, "// Code"), t({"", "}"}),
  }),

  -- If Statement
  s("~if", {
    t({"if ("}), i(1, "// condition"), t({") {", "  "}), i(2, "// Code"), t({"", "}"}),
  }),

  -- Class Template
  s("~class", {
    t({"public class "}), i(1, "MyClass"), t({" {", "  "}), i(2, "// Fields and methods"), t({"", "}"}),
  }),
})
