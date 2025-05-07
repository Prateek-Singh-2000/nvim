local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Add Python snippets
ls.add_snippets("python", {
	-- Class snippet
	s("class", {
		t("class "), i(1, "ClassName"), t("("), i(2, "object"), t("):"),
		t({ "", "    \"\"\"" }),
		t({ "", "    " }), i(3, "Class docstring"),
		t({ "", "    \"\"\"" }),
		t({ "", "" }),
		t({ "", "    def __init__(self, " }), i(4), t("):"),
		t({ "", "        \"\"\"" }),
		t({ "", "        Initialize " }), f(function(args) return args[1][1] end, { 1 }), t(" instance."),
		t({ "", "        " }),
		t({ "", "        Args:" }),
		t({ "", "            " }), i(5, "param1 (type): Description"),
		t({ "", "        \"\"\"" }),
		t({ "", "        " }), i(0),
	}),

	-- Function definition
	s("def", {
		t("def "), i(1, "function_name"), t("("), i(2), t(") -> "), i(3, "None"), t(":"),
		t({ "", "    \"\"\"" }),
		t({ "", "    " }), i(4, "Function docstring"),
		t({ "", "    " }),
		t({ "", "    Args:" }),
		t({ "", "        " }), i(5, "param1 (type): Description"),
		t({ "", "    " }),
		t({ "", "    Returns:" }),
		t({ "", "        " }), i(6, "return_type: Description"),
		t({ "", "    \"\"\"" }),
		t({ "", "    " }), i(0),
	}),

	-- Try/except block
	s("try", {
		t({ "try:", "    " }), i(1),
		t({ "", "except " }), i(2, "Exception"), t(" as "), i(3, "e"), t(":"),
		t({ "", "    " }), i(4, "pass"),
		t({ "", "" }), i(0),
	}),

	-- List comprehension
	s("lc", {
		t("["), i(1, "expression"), t(" for "), i(2, "item"), t(" in "), i(3, "iterable"), t("]"), i(0),
	}),

	-- dict[str,Any]
	s("dictsa", {
		t("dict[str, Any]")
	})
})
