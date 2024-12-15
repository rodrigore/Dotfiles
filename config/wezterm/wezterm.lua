local wezterm = require("wezterm")
local mod = "CMD"
local act = wezterm.action

local function font(opts)
  return wezterm.font_with_fallback({
    opts,
    "Liga SFMono Nerd Font",
  })
end

-- wezterm.on('augment-command-palette', function(window, pane)
--   return {
--     {
--       brief = 'Rename tab rodri',
--       icon = 'md_rename_box',
--
--       action = act.PromptInputLine {
--         description = 'Enter new name for tab',
--         action = wezterm.action_callback(function(window, pane, line)
--           if line then
--             window:active_tab():set_title(line)
--           end
--         end),
--       },
--     },
--   }
-- end)

-- remove padding only on nvim
wezterm.on('update-status', function(window, pane)
    local padding = {
        left = '1cell',
        right = 0,
        top = 0,
        bottom = 0,
    }
    local overrides = window:get_config_overrides() or {}
    if string.find(pane:get_title(), '^n-vi-m-.*') then
      overrides.window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
    else
        overrides.window_padding = padding
    end
    window:set_config_overrides(overrides)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local title = pane.foreground_process_name
  -- get the last string from the abs path of the title string
  local processName = string.match(title, "[^/]+$")

  -- I want a lua tables with the process list and I want to pass the processName and return the values
  local list = {
    bash= "",
    caffeinate= "",
    brew= "",
    fish= "",
    git= "",
    lazygit= "",
    pm2= "",
    ['pm2 log']= "",
    node= "",
    npm= "",
    nvim= "",
    ssh= "",
    tmux= "",
    wezterm= "",
  }

  return {
    { Text = " " .. list[processName] .. " " },
    -- { Text = " " .. tab.active_pane.title .. " " },
  }
end)

local config =  {
  color_scheme_dirs = { "/Users/rodrigoguzman/.config/wezterm/colorschemes" },
  font = font("Dank Mono"),
  font_size = 18.0,
  line_height = 2,
  default_cursor_style = "BlinkingBar",
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,
  window_decorations = "RESIZE",
  bold_brightens_ansi_colors = true,
  cell_width = 0.90,
  -- window_padding = {
  --   left = '1cell',
  --   right = 0,
  --   top = 0,
  --   bottom = 0,
  -- },
  window_close_confirmation = 'NeverPrompt',
  quick_select_alphabet = "arstqwfpzxcvneioluymdhgjbk",
  -- command palette
  command_palette_font_size = 16.0,
  command_palette_fg_color = '#82aaff', --'white', --rgba(0.75, 0.75, 0.75, 0.8)',
  command_palette_bg_color = "#191b28",

  -- key bindings
  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
  -- disable_default_key_bindings = true,
  keys = {
    -- { mods = mod, key = "[", action = act.SendString '\x1b\x0a' }, --  option + [
    -- { mods = mod, key = "[", action = act.SendKey {key = '[', mods = 'OPT'}},

  -- tmux keybinding
  -- keys = {
    { key = 't', mods = 'CMD', action = wezterm.action.SendString '\x02\x63' }, --  create new TMUX window
    { key = 'e', mods = 'CMD', action = wezterm.action.SendString '\x02%' }, --  split tmux windows vertically
    { key = 'e', mods = 'CMD|SHIFT', action = wezterm.action.SendString '\x02\"' }, --  split tmux window horizontally
    { key = 'w', mods = 'CMD', action = wezterm.action.SendString '\x02x' }, --kill the current pane
    { key = 'z', mods = 'CMD', action = wezterm.action.SendString '\x02z' }, -- toggle zoom state of the current tmux pane
    { key = ',', mods = 'CMD', action = wezterm.action.SendString '\x02,' }, -- rename the current tmux window
    { key = ']', mods = 'CMD', action = wezterm.action.SendString '\x02n' }, -- switch to next tmux window
    { key = '[', mods = 'CMD', action = wezterm.action.SendString '\x02p' }, -- switch to next tmux window
    { key = 'j', mods = 'CMD', action = wezterm.action.SendString '\x02\x54' }, -- sesh session manager
    { key = 'h', mods = 'CTRL', action = wezterm.action.SendString '\x02h' }, -- navigate left
    { key = 'j', mods = 'CTRL', action = wezterm.action.SendString '\x02j' }, -- navigate down
    { key = 'k', mods = 'CTRL', action = wezterm.action.SendString '\x02k' }, -- navigate up
    { key = 'l', mods = 'CTRL', action = wezterm.action.SendString '\x02l' }, -- navigate right
    { key = 'p', mods = 'CMD', action = wezterm.action.SendString '\x10' },   -- ctrl+p
  -- }

    -- wezterm
    -- {mods = mod, key = "[", action = wezterm.action {ActivateTabRelative = -1}},
    -- {mods = mod, key = "]", action = wezterm.action {ActivateTabRelative = 1}},
    -- { mods = mod, key = "t", action = act.SpawnTab("CurrentPaneDomain") },
    -- { mods = mod, key = "w", action = act.CloseCurrentPane { confirm = false } },
    -- { mods = mod, key = "e", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    -- { mods = 'CMD|SHIFT', key = "e", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    -- { mods = mod, key = "h", action = act.ActivatePaneDirection 'Left' },
    -- { mods = mod, key = "l", action = act.ActivatePaneDirection 'Right' },
    -- { mods = mod, key = "j", action = act.ActivatePaneDirection 'Down' },
    -- { mods = mod, key = "k", action = act.ActivatePaneDirection 'Up' },
    -- { mods = mod, key = "c", action = act.CopyTo("ClipboardAndPrimarySelection") },
    -- { mods = mod, key = "z", action = act.TogglePaneZoomState },
    -- { mods = mod, key = "p", action = act.ActivateCommandPalette, },
    -- { mods = 'OPT', key = "h", action = act.AdjustPaneSize { 'Left', 5 } },
    -- { mods = 'OPT', key = "j", action = act.AdjustPaneSize { 'Down', 5 } },
    -- { mods = 'OPT', key = "k", action = act.AdjustPaneSize { 'Up', 5 } },
    -- { mods = 'OPT', key = "l", action = act.AdjustPaneSize { 'Right', 5 } },
    -- { mods = 'LEADER', key = "H", action = act.AdjustPaneSize { 'Left', 5 } },
    -- { mods = 'LEADER', key = "J", action = act.AdjustPaneSize { 'Down', 5 } },
    -- { mods = 'LEADER', key = "K", action = act.AdjustPaneSize { 'Up', 5 } },
    -- { mods = 'LEADER', key = "L", action = act.AdjustPaneSize { 'Right', 5 } },
    -- { key = '[', mods = 'LEADER', action = act.ActivateCopyMode, },
    {
      mods = 'CMD|SHIFT',
      key = 's',
      action = wezterm.action_callback(function(window, pane)
        -- Here you can dynamically construct a longer list if needed

        local home = wezterm.home_dir
        local workspaces = {
          { id = home, label = 'Home' },
          { id = home .. '/work', label = 'Work' },
          { id = home .. '/personal', label = 'Personal' },
          { id = home .. '/.config', label = 'Config' },
        }

        window:perform_action(
          act.InputSelector {
            action = wezterm.action_callback(
              function(inner_window, inner_pane, id, label)
                if not id and not label then
                  wezterm.log_info 'cancelled'
                else
                  wezterm.log_info('id = ' .. id)
                  wezterm.log_info('label = ' .. label)
                  inner_window:perform_action(
                    act.SwitchToWorkspace {
                      name = label,
                      spawn = {
                        label = 'Workspace: ' .. label,
                        cwd = id,
                      },
                    },
                    inner_pane
                  )
                end
              end
            ),
            title = 'Choose Workspace',
            choices = workspaces,
            fuzzy = true,
            fuzzy_description = 'Fuzzy find and/or make a workspace',
          },
          pane
        )
      end),
    },
    {
    key = 'N',
    mods = 'CTRL|SHIFT',
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
    -- { mods = mod, key = "l", action = act({ ActivateTabRelative = 1 }) },
    -- { mods = mod, key = "h", action = act({ ActivateTabRelative = -1 }) },
    -- { mods = mod, key = "p", action = act.PaneSelect({ alphabet = "", mode = "Activate" }) },
    -- { mods = mod, key = "d", action = wezterm.action.ShowDebugOverlay },
  },
}

-- colorscheme
local appearance = wezterm.gui.get_appearance()

if appearance:find 'Dark' then
  config.color_scheme = 'duskfox'
else
  config.color_scheme = 'catpuccin_latte'
end

wezterm.on("user-var-changed", function(window, pane, name, value)
  	local overrides = window:get_config_overrides() or {}

  if name == "DIFF_VIEW" then
      local incremental = value:find("+")
      local number_value = tonumber(value)
      if incremental ~= nil then
        while number_value > 0 do
          window:perform_action(wezterm.action.DecreaseFontSize, pane)
          number_value = number_value - 1
        end
      elseif number_value < 0 then
        window:perform_action(wezterm.action.ResetFontSize, pane)
        overrides.background = nil
        overrides.font_size = nil
      else
        overrides.font_size = number_value
      end
    end
    window:set_config_overrides(overrides)
  end)

return config
