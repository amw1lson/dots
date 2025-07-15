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
        }
    },
}
require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("file_browser")

