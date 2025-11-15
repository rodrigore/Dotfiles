local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

local M = {}

-- Define icon mappings for different folder types/patterns
local folder_icons = {
  -- Project types
  ["api"] = "🔧",
  ["backend"] = "⚙️",
  ["frontend"] = "🎨",
  ["mobile"] = "📱",
  ["web"] = "🌐",
  
  -- Common folders
  ["docs"] = "📚",
  ["downloads"] = "📥",
  ["home"] = "🏠",
  ["projects"] = "💻",
  ["config"] = "⚡",
  
  -- Development environments
  ["node"] = "📦",
  ["python"] = "🐍",
  ["rust"] = "🦀",
  ["go"] = "🔵",
  
  -- Custom project mappings
  ["minion"] = "🤖",
  ["redsentry"] = "🎯",
  ["neovim"] = "📝",
}

-- Pattern matching for more specific folder types
local folder_patterns = {
  { pattern = "api", icon = "🔧" },
  { pattern = "frontend", icon = "🎨" },
  { pattern = "backend", icon = "⚙️" },
  { pattern = "config", icon = "⚡" },
  { pattern = "docs?", icon = "📚" },  -- matches doc or docs
  { pattern = "download[s]?", icon = "📥" }, -- matches download or downloads
  { pattern = "projects?", icon = "💻" }, -- matches project or projects
  { pattern = "mobile", icon = "📱" },
  { pattern = "web", icon = "🌐" },
}

-- Function to get icon for a given path
local function get_icon_for_path(path)
  -- Extract the base folder name
  local base_name = string.gsub(path, "(.*[/\\])(.*)", "%2"):lower()
  
  -- First check direct matches
  if folder_icons[base_name] then
    return folder_icons[base_name]
  end
  
  -- Then check pattern matches
  for _, pattern_def in ipairs(folder_patterns) do
    if string.match(base_name, pattern_def.pattern) then
      return pattern_def.icon
    end
  end
  
  -- Default icon if no matches
  return "📁"
end

-- Custom workspace formatter
workspace_switcher.workspace_formatter = function(label)
  local icon = get_icon_for_path(label)
  return wezterm.format({
    { Foreground = { Color = "#89B4FA" } }, -- Use Catppuccin Mocha blue color
    { Text = icon .. " " },
    { Foreground = { Color = "#CDD6F4" } }, -- Use Catppuccin Mocha text color
    { Text = label },
  })
end

function M.setup(config)
  -- Ensure config exists
  config = config or {}
  
  -- Set up colors if not already defined
  config.colors = config.colors or {}
  config.colors.fuzzy_highlight = config.colors.fuzzy_highlight or "#89B4FA"
  
  -- Apply the workspace switcher to the config
  workspace_switcher.apply_to_config(config)
  
  -- Set up event handler for status updates
  wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", function(window, workspace)
    local gui_win = window:gui_window()
    local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
    local icon = get_icon_for_path(workspace)
    gui_win:set_right_status(wezterm.format({
      { Foreground = { Color = "#89B4FA" } },
      { Text = icon .. " " },
      { Foreground = { Color = "#CDD6F4" } },
      { Text = base_path .. "  " },
    }))
  end)
  
  return config
end

return M
