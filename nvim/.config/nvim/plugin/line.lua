require('lualine').setup {
    options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            { 'branch', color = function(_) return { gui = 'bold' } end },
        },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'encoding' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
    },
}
