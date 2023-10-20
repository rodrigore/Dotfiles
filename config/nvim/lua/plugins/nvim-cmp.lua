local cmp = require("cmp")
return {
  "hrsh7th/nvim-cmp",
  opts = {
    completion = {
      autocomplete = false,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-t>"] = cmp.mapping.complete(),
    }),
    keys = function ()
      return {}
    end,
  },
}
