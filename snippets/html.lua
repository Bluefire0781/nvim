local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("html", {

  --default format
  s("~def", {
    t({
      "<!DOCTYPE html>",
      "<html lang=\"en\">",
      "<head>",
      "  <meta charset=\"UTF-8\">",
      "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
      "  <title>", }), i(1, "Document"), t({"</title>",
      "</head>",
      "<body>",
      "  "}), i(2, "Content here"), t({
      "",
      "</body>",
      "</html>",
    }),
  }),

  -- Link CSS
  s("~css", {
    t('<link rel="stylesheet" href="'), i(1, "styles.css"), t('">'),
  }),

  --head
  s("~head", {
    t({"<head>", "</head>"})
  }),

  -- Script Tag
  s("~script", {
    t('<script src="'), i(1, "script.js"), t('"></script>'),
  }),

  -- Div Container
  s("~div", {
    t('<div class="'), i(1, "container"), t('">'), t({"",
      "  "}), i(2, "Content"), t({
      "",
      "</div>",
    }),
  }),

  -- Paragraph
  s("~p", {
    t("<p>"), i(1, "Text here"), t("</p>"),
  }),

  -- Image
  s("~img", {
    t('<img src="'), i(1, "image.jpg"), t('" alt="'), i(2, "description"), t('">'),
  }),

  -- Anchor (Link)
  s("~a", {
    t('<a href="'), i(1, "https://example.com"), t('">'), i(2, "Link Text"), t("</a>"),
  }),

  -- Button
  s("~but", {
    t('<button>'), i(1, "Click Me"), t("</button>"),
  }),

  -- Input Field
  s("~input", {
    t('<input type="'), i(1, "text"), t('" name="'), i(2, "fieldname"), t('">'),
  }),

  -- Comment
  s("~comment", {
    t("<!-- "), i(1, "Comment here"), t(" -->"),
  }),

})
