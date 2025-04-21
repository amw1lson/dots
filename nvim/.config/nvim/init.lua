require("plxg.lazy")
require("plxg.telescope")
require("nvim-autopairs").setup()
require("mini.surround").setup({
    custom_surroundings = {
      -- Make `)` insert parts with spaces. `input` pattern stays the same.
      ['{'] = { output = { left = '{', right = '}' } },
      ['l'] = { output = { left = '\\left(', right = '\\right)' } },
      ['L'] = { output = { left = '\\left[', right = '\\right]' } },
      ['B'] = { output = { left = '{', right = '}' } },
    },
})
