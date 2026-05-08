return {
  'f4z3r/gruvbox-material.nvim',
  name = 'gruvbox-material',
  lazy = false,
  priority = 1000,
	config = function()
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_background = "medium"
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_better_performance = 1
  end,
  opts = {},
}
