-- Pull in the wezterm API
local wezterm = require("wezterm")
-- local k = require("./utils/keys.lua")
local wt_action = require("wezterm").action
local M = {}

M.multiple_actions = function(keys)
	local actions = {}
	for key in keys:gmatch(".") do
		table.insert(actions, wt_action.SendKey({ key = key }))
	end
	table.insert(actions, wt_action.SendKey({ key = "\n" }))
	return wt_action.Multiple(actions)
end

M.key_table = function(mods, key, action)
	return {
		mods = mods,
		key = key,
		action = action,
	}
end

M.cmd_key = function(key, action)
	return M.key_table("CMD", key, action)
end

M.cmd_to_tmux_prefix = function(key, tmux_key, next_key)
	return M.cmd_key(
		key,
		wt_action.Multiple({
			-- option + y
			wt_action.SendKey({ mods = "OPT", key = "y" }),
			wt_action.SendKey({ key = tmux_key }),
		})
	)
end

local k = M

-- This will hold the configuration.
local config = wezterm.config_builder()
-- This is where you actually apply your config choices

local my_onedark = wezterm.color.get_builtin_schemes()["OneDark (base16)"]
my_onedark.background = "#171C27"

config = {

	font_size = 13,
	bold_brightens_ansi_colors = true,
	line_height = 1.1,
	font = wezterm.font_with_fallback({
		{ family = "FiraCode Nerd Font Mono", weight = "Regular" },
		{ family = "Hack Nerd Font Mono", weight = "Regular" },
		-- { family = "Brekerly Mono" },
		-- { family = "Symbols Nerd Font Mono", weight = "Regular" },
	}),

	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 0,
	},

	-- debug_key_events = false,
	-- enable_tab_bar = false,
	-- native_macos_fullscreen_mode = true,
	window_decorations = "RESIZE",

	-- cell_width =0.7,
	-- font_rules = {
	-- 	{
	-- 		italic = true,
	-- 		font = wezterm.font("Cica", { italic = true }),
	-- 	},
	-- 	{
	-- 		italic = true,
	-- 		intensity = "Bold",
	-- 		font = wezterm.font("Cica", { weight = "Bold", italic = true }),
	-- 	},
	-- },
	check_for_updates = false,
	use_ime = true,
	ime_preedit_rendering = "Builtin",
	-- use_dead_keys = false,
	warn_about_missing_glyphs = false,
	-- enable_kitty_graphics = false,
	animation_fps = 1,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 0,
	set_environment_variables = {
		TERM = "xterm-256color",
	},
	keys = {
		k.cmd_to_tmux_prefix("j", "DownArrow", " "),
		k.cmd_to_tmux_prefix("k", "UpArrow"),
		k.cmd_to_tmux_prefix("h", "LeftArrow"),
		k.cmd_to_tmux_prefix("l", "RightArrow"),
		k.cmd_to_tmux_prefix("m", "z"),
		{
			key = "h",
			mods = "OPT",
			action = wt_action.SendKey({
				key = "h",
				mods = "CTRL",
			}),
		},
	},

	-- https://github.com/wez/wezterm/issues/4972
	--enable_wayland = enable_wayland(),
	-- https://github.com/wez/wezterm/issues/1772
	-- color = {
	--        background = "#2F3448",
	--        foreground = "#D8DEE9"
	--    },
	--enable_wayland = false,
	color_schemes = {
		["My OneDark"] = my_onedark,
	},
	color_scheme = "My OneDark",
	-- color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors/" },
	hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
	selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%",
	-- window_padding = {
	-- 	left = 0,
	-- 	right = 0,
	-- 	top = 0,
	-- 	bottom = 0,
	-- },
	use_fancy_tab_bar = false,
	colors = {
		tab_bar = {
			-- background = scheme.background,
			-- new_tab = { bg_color = "#2e3440", fg_color = scheme.ansi[8], intensity = "Bold" },
			-- new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
			-- format-tab-title
			-- active_tab = { bg_color = "#121212", fg_color = "#FCE8C3" },
			-- inactive_tab = { bg_color = scheme.background, fg_color = "#FCE8C3" },
			-- inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = "#FCE8C3" },
		},
	},
	exit_behavior = "CloseOnCleanExit",
	tab_bar_at_bottom = true,
	freetype_load_target = "HorizontalLcd",
	-- window_close_confirmation = "AlwaysPrompt",
	-- window_background_opacity = 0.8,
	-- disable_default_key_bindings = true,
	-- visual_bell = {
	-- 	fade_in_function = "EaseIn",
	-- 	fade_in_duration_ms = 150,
	-- 	fade_out_function = "EaseOut",
	-- 	fade_out_duration_ms = 150,
	-- },
	-- separate <Tab> <C-i>
	enable_csi_u_key_encoding = true,
	leader = { key = "Space", mods = "CTRL|SHIFT" },
	-- keys = keybinds.create_keybinds(),
	-- key_tables = keybinds.key_tables,
	-- mouse_bindings = keybinds.mouse_bindings,
	-- https://github.com/wez/wezterm/issues/2756
	-- webgpu_preferred_adapter = gpus[1],
	front_end = "OpenGL",
}

-- and finally, return the configuration to wezterm
return config
