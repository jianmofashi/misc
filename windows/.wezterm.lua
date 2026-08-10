-- 引入 wezterm 模块
local wezterm = require("wezterm")

-- 推荐使用 config_builder，方便后续扩展
local config = wezterm.config_builder()

-- ========= 外观 =========
-- config.color_scheme = "Tokyo Night Storm"
config.color_scheme = "Moonlight"
config.window_background_opacity = 0.80
config.text_background_opacity = 1.0
config.window_decorations = 'RESIZE'
config.enable_scroll_bar = true
-- 字体
-- config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font = wezterm.font_with_fallback({
  { family = 'JetBrainsMono Nerd Font', weight = 'Medium' },
  { family = '等距更纱黑体 SC' },
})

config.font_size = 12
config.line_height = 1.1
config.cell_width = 1.0

config.freetype_load_target = 'Mono'
config.freetype_render_target = 'Normal'

-- ========= 标签栏 =========
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 32

-- ========= 窗口 =========
config.window_padding = {
  left = 8,
  right = 8,
  top = 6,
  bottom = 6,
}

config.initial_cols = 120
config.initial_rows = 32


-- ========= 默认启动 PowerShell 7 =========
config.default_prog = { "pwsh.exe", "-NoLogo" }

-- 最后一个标签关闭时，直接关闭窗口
config.exit_behavior = "Close"

-- 终端最大滚动缓存行数
config.scrollback_lines = 8000

-- 禁止修改字号时自动调整窗口大小
config.adjust_window_size_when_changing_font_size = false

-- ========= 启动菜单 =========
config.launch_menu = {
  {
    label = "Windows PowerShell",
    args = { "powershell.exe", "-NoLogo" },
  },
  {
    label = "PowerShell 7",
    args = { "pwsh.exe", "-NoLogo" },
  },
  {
  label = "PowerShell 7 Admin",
  args = {
    "pwsh.exe",
    "-NoProfile",
    "-Command",
    "Start-Process wezterm -Verb RunAs"
    },
  },
  {
    label = "Command Prompt",
    args = { "cmd.exe" },
  },
  {
    label = "Arch Linux (WSL)",
    args = {
      "wsl.exe",
      "-d", "archlinux",  -- 注意是全小写
      "--user", "cjw",
      "--cd", "~",
    },
   },
}

-- ========= 快捷键 =========
config.keys = {
   -- Alt + Shift + → ：向右创建分屏
    {
      key = "RightArrow",
      mods = "ALT|SHIFT",
      action = wezterm.action.SplitHorizontal({
        domain = "CurrentPaneDomain",
      }),
    },

    -- Alt + Shift + ↓ ：向下创建分屏
    {
      key = "DownArrow",
      mods = "ALT|SHIFT",
      action = wezterm.action.SplitVertical({
        domain = "CurrentPaneDomain",
      }),
    },

    -- Alt + W ：关闭当前分屏
    {
      key = "w",
      mods = "ALT",
      action = wezterm.action.CloseCurrentPane({
        confirm = true,
      }),
    },

    -- Alt + 方向键：切换分屏焦点
    {
      key = "LeftArrow",
      mods = "ALT",
      action = wezterm.action.ActivatePaneDirection("Left"),
    },
    {
      key = "RightArrow",
      mods = "ALT",
      action = wezterm.action.ActivatePaneDirection("Right"),
    },
    {
      key = "UpArrow",
      mods = "ALT",
      action = wezterm.action.ActivatePaneDirection("Up"),
    },
    {
      key = "DownArrow",
      mods = "ALT",
      action = wezterm.action.ActivatePaneDirection("Down"),
    },

    -- Ctrl + Alt + 方向键：调整分屏大小
    {
      key = "LeftArrow",
      mods = "CTRL|ALT",
      action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
    },
    {
      key = "RightArrow",
      mods = "CTRL|ALT",
      action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
    },
    {
      key = "UpArrow",
      mods = "CTRL|ALT",
      action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
    },
    {
      key = "DownArrow",
      mods = "CTRL|ALT",
      action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
    },
    {
      key = "m",
      mods = "ALT",
      action = wezterm.action.ShowLauncherArgs({
        flags = "LAUNCH_MENU_ITEMS",
      }),
    },
}

return config