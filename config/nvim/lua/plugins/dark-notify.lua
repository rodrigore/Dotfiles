return {
  "cormacrelf/dark-notify",
  init = function()
    require("dark_notify").run({
      schemes = {
        dark = "duskfox",
        light = "dawnfox",
      },
    })
  end,
}
