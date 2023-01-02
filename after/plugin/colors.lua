function ColorMyPencils(color)
	color = color or "nord"

	vim.g.nord_contrast = true
	vim.g.nord_italic = false
    vim.g.nord_disable_background = true
	vim.cmd.colorscheme(color)

	-- transparency
	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

ColorMyPencils()
