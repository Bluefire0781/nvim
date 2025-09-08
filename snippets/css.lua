local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node -- For placeholders

ls.filetype_extend("javascriptreact", { "javascript" })

ls.add_snippets("javascript", {
  s("div", {
    t("<div></div>")
  }),
})
