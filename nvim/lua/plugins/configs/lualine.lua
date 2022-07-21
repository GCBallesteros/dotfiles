require'lualine'.setup{
    options = { theme = 'neon' },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'diagnostics',
                sources = {'nvim_lsp'}
            }
        },
        lualine_c = {},
        lualine_x = {'encoding', 'fileformat', 'filetype'}
    },
    tabline = {
      lualine_a = {},
      lualine_b = {'branch', 'diff'},
      lualine_c = {{'filename', path=3}},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    }
}
