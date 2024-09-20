require('lualine').setup {
    options = {
        theme = 'auto'
    },
    sections = {
        lualine_c = {
            {
                'filename',
                path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        }
    }}
