local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        layout_strategy = 'horizontal',
    },
    pickers = {
        find_files = {
            hidden = true,
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        ["ui-select"] = {
              require("telescope.themes").get_dropdown {
              }
              -- pseudo code / specification for writing custom displays, like the one
              -- for "codeactions"
              -- specific_opts = {
              --   [kind] = {
              --     make_indexed = function(items) -> indexed_items, width,
              --     make_displayer = function(widths) -> displayer
              --     make_display = function(displayer) -> function(e)
              --     make_ordinal = function(e) -> string
              --   },
              --   -- for example to disable the custom builtin "codeactions" display
              --      do the following
              --
              --   codeactions = false,
              -- }
        }
    },
}
require("telescope").load_extension("ui-select")
require('telescope').load_extension('fzy_native')
