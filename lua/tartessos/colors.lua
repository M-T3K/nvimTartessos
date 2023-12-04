local editor_background = "#001920"


local colors = {
	black = "#181a1f",
	background = editor_background,
	margin = "#0d1b20",
	cursor = "#FFFB00",
	text_at_cursor = editor_background,
	highlight_current_line = "#252525",
	text_default = "#F9FAF0",
	text_comments = "#2ED30D",
	text_keywords = "#E6D47E",
	text_string = "#00DADA",
	text_char = "#00DADA",
	text_math = "#B0F5E6",
	text_preprocessor = "#00D9FF",
	editor_bar = "#003e57",
	editor_bar_active = "#00324b",
	editor_bar_text = "#faf9e6",
	editor_line_numbers = "#faf9e6",
	diff_add = "#31392b",
	diff_delete = "#382b2c",
	diff_change = "#1c3448",
	diff_text = "#2c5372",
}

local function select_colors()
	local selected = { none = "none" }
	selected = vim.tbl_extend("force", selected, colors)
	selected = vim.tbl_extend("force", selected, vim.g.tartessos_config.colors)
	return selected
end

return select_colors()
