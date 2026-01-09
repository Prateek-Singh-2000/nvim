local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Add TypeScript snippets
ls.add_snippets("typescript", {
	-- Console log
	s("cl", {
		t("console.log("),
		i(1, "value"),
		t(");"),
		i(0)
	}),

	-- Console log with variable name
	s("clv", {
		t("console.log('"),
		i(1, "varName"),
		t(":', "),
		f(function(args) return args[1][1] end, {1}),
		t(");"),
		i(0)
	}),

	-- Arrow function
	s("af", {
		t("const "),
		i(1, "funcName"),
		t(" = ("),
		i(2, "params"),
		t(") => {"),
		t({"", "  "}),
		i(0),
		t({"", "}"})
	}),

	-- Async arrow function
	s("aaf", {
		t("const "),
		i(1, "funcName"),
		t(" = async ("),
		i(2, "params"),
		t(") => {"),
		t({"", "  "}),
		i(0),
		t({"", "}"})
	}),

	-- Interface
	s("int", {
		t("interface "),
		i(1, "InterfaceName"),
		t(" {"),
		t({"", "  "}),
		i(0),
		t({"", "}"})
	}),

	-- Type alias
	s("type", {
		t("type "),
		i(1, "TypeName"),
		t(" = "),
		i(0),
		t(";")
	}),

	-- Import statement
	s("imp", {
		t("import { "),
		i(1, "module"),
		t(" } from '"),
		i(2, "path"),
		t("';"),
		i(0)
	}),

	-- Import default
	s("impd", {
		t("import "),
		i(1, "module"),
		t(" from '"),
		i(2, "path"),
		t("';"),
		i(0)
	}),

	-- Try-catch
	s("tryc", {
		t("try {"),
		t({"", "  "}),
		i(1),
		t({"", "} catch ("}),
		i(2, "error"),
		t(") {"),
		t({"", "  "}),
		i(0),
		t({"", "}"})
	}),

	-- Promise
	s("prom", {
		t("new Promise<"),
		i(1, "type"),
		t(">((resolve, reject) => {"),
		t({"", "  "}),
		i(0),
		t({"", "})"})
	}),
})

ls.add_snippets("typescriptreact", {
	-- Console log
	s("cl", {
		t("console.log("),
		i(1, "value"),
		t(");"),
		i(0)
	}),

	-- Console log with variable name
	s("clv", {
		t("console.log('"),
		i(1, "varName"),
		t(":', "),
		f(function(args) return args[1][1] end, {1}),
		t(");"),
		i(0)
	}),

	-- Arrow function
	s("af", {
		t("const "),
		i(1, "funcName"),
		t(" = ("),
		i(2, "params"),
		t(") => {"),
		t({"", "  "}),
		i(0),
		t({"", "}"})
	}),

	-- Async arrow function
	s("aaf", {
		t("const "),
		i(1, "funcName"),
		t(" = async ("),
		i(2, "params"),
		t(") => {"),
		t({"", "  "}),
		i(0),
		t({"", "}"})
	}),

	-- Interface
	s("int", {
		t("interface "),
		i(1, "InterfaceName"),
		t(" {"),
		t({"", "  "}),
		i(0),
		t({"", "}"})
	}),

	-- Type alias
	s("type", {
		t("type "),
		i(1, "TypeName"),
		t(" = "),
		i(0),
		t(";")
	}),

	-- Import statement
	s("imp", {
		t("import { "),
		i(1, "module"),
		t(" } from '"),
		i(2, "path"),
		t("';"),
		i(0)
	}),

	-- Import default
	s("impd", {
		t("import "),
		i(1, "module"),
		t(" from '"),
		i(2, "path"),
		t("';"),
		i(0)
	}),

	-- Try-catch
	s("tryc", {
		t("try {"),
		t({"", "  "}),
		i(1),
		t({"", "} catch ("}),
		i(2, "error"),
		t(") {"),
		t({"", "  "}),
		i(0),
		t({"", "}"})
	}),

	-- Promise
	s("prom", {
		t("new Promise<"),
		i(1, "type"),
		t(">((resolve, reject) => {"),
		t({"", "  "}),
		i(0),
		t({"", "})"})
	}),
})

