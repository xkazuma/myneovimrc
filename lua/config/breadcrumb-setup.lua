local breadcrumb = require("breadcrumb")

breadcrumb.setup({
	disabled_filetype = {
		"",
		"help",
	},
	icons = {
    File          = "",
    Module        = "󱒌",
    Namespace     = "",
    Package       = "",
    Class         = "󰯲",
    Method        = "󰰑",
    Property      = "󰰚",
    Field         = "󰯼",
    Constructor   = "",
    Enum          = "󰯹",
    Interface     = "󰰅",
    Function      = "󰡱",
    Variable      = "󰫧",
    Constant      = "",
    String        = "",
    Number        = "",
    Boolean       = "",
    Array         = "󰅨",
    Object        = "󰲟",
    Key           = "",
    Null          = "󰟢",
    EnumMember    = "",
    Struct        = "󰰣",
    Event         = "",
    Operator      = "",
    TypeParameter = "",
    Component     = "󰹫",
    Fragment      = "",
	},
	separator = ">",
	depth_limit = 0,
	depth_limit_indicator = "..",
    	color_icons = true,
	highlight_group = {
		component = "BreadcrumbText",
		separator = "BreadcrumbSeparator",
	},
})

breadcrumb.init()
