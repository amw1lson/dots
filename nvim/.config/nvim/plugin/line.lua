require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '', right = ''},
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            { 'branch',
                icons_enabled = false,
                color = function(section)
                    return { gui = 'bold' }
                end
            },
        },
        lualine_c = {
            { 'filename',
                color = function(section)
                    return { fg = vim.bo.modified and '#ff7eb6' or '#3ddbd9', gui = 'bold' }
                end,
            }
        },
        lualine_x = {
            { 'filetype',
                icons_enabled = false,
            },
        },
        lualine_y = { 'encoding' },
        lualine_z = { 'location' }
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
