local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function capitalize(args)
	local str = args[1][1] or ""
	return str:gsub("^%l", string.upper)
end

ls.filetype_extend("typescriptreact", { "typescript" })

ls.add_snippets("typescript", {
	s("cl", {
		t("console.log("),
		i(1, "value"),
		t(");"),
		i(0),
	}),

	s("clv", {
		t("console.log('"),
		i(1, "varName"),
		t(":', "),
		f(function(args) return args[1][1] end, { 1 }),
		t(");"),
		i(0),
	}),

	s("af", {
		t("const "),
		i(1, "funcName"),
		t(" = ("),
		i(2, "params"),
		t(") => {"),
		t({ "", "  " }),
		i(0),
		t({ "", "}" }),
	}),

	s("aaf", {
		t("const "),
		i(1, "funcName"),
		t(" = async ("),
		i(2, "params"),
		t(") => {"),
		t({ "", "  " }),
		i(0),
		t({ "", "}" }),
	}),

	s("int", {
		t("interface "),
		i(1, "InterfaceName"),
		t(" {"),
		t({ "", "  " }),
		i(0),
		t({ "", "}" }),
	}),

	s("type", {
		t("type "),
		i(1, "TypeName"),
		t(" = "),
		i(0),
		t(";"),
	}),

	s("imp", {
		t("import { "),
		i(1, "module"),
		t(" } from '"),
		i(2, "path"),
		t("';"),
		i(0),
	}),

	s("impd", {
		t("import "),
		i(1, "module"),
		t(" from '"),
		i(2, "path"),
		t("';"),
		i(0),
	}),

	s("tryc", {
		t("try {"),
		t({ "", "  " }),
		i(1),
		t({ "", "} catch (" }),
		i(2, "error"),
		t(") {"),
		t({ "", "  " }),
		i(0),
		t({ "", "}" }),
	}),

	s("prom", {
		t("new Promise<"),
		i(1, "type"),
		t(">((resolve, reject) => {"),
		t({ "", "  " }),
		i(0),
		t({ "", "})" }),
	}),
})

ls.add_snippets("typescriptreact", {
	s("rfc", {
		t("interface "), i(1, "Props"), t({ " {", "  " }), i(2), t({ "", "}", "", "" }),
		t("export const "), i(3, "Component"), t(" = ({ "), i(4), t(" }: "), f(function(args) return args[1][1] end, { 1 }),
		t(") => {"),
		t({ "", "  return (" }),
		t({ "", "    <div>" }),
		i(0),
		t({ "", "    </div>" }),
		t({ "", "  );" }),
		t({ "", "};" }),
	}),

	s("us", {
		t("const ["), i(1, "state"), t(", set"), f(capitalize, { 1 }), t("] = useState"),
		t("<"), i(2, "type"), t(">("), i(3, "initialValue"), t(");"),
		i(0),
	}),

	s("ue", {
		t({ "useEffect(() => {", "  " }),
		i(1),
		t({ "", "}, [" }),
		i(2),
		t("]);"),
		i(0),
	}),

	s("uc", {
		t("const "), i(1, "memoizedCallback"), t(" = useCallback(("), i(2, "params"), t(") => {"),
		t({ "", "  " }), i(3),
		t({ "", "}, [" }), i(4), t("]);"),
		i(0),
	}),

	s("um", {
		t("const "), i(1, "memoizedValue"), t(" = useMemo(() => {"),
		t({ "", "  return " }), i(2),
		t({ "", "}, [" }), i(3), t("]);"),
		i(0),
	}),

	s("ur", {
		t("const "), i(1, "ref"), t(" = useRef<"), i(2, "HTMLDivElement"), t(">("), i(3, "null"), t(");"),
		i(0),
	}),
})
