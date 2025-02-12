--- @type LazyPluginSpec
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'arkav/lualine-lsp-progress',
  },
  config = function()
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local colors = {
      bg = '#1e1e2e',
      fg = '#cdd6f4',
      yellow = '#f9e2af',
      cyan = '#89dceb',
      darkblue = '#89b4fa',
      green = '#a6e3a1',
      orange = '#fab387',
      violet = '#f5c2e7',
      magenta = '#cba6f7',
      blue = '#74c7ec',
      red = '#f38ba8',
    }

    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }

    local theme = {
      normal = {
        a = { bg = 'None', gui = 'bold' },
        b = { bg = 'None', gui = 'bold' },
        c = { bg = 'None', gui = 'bold' },
        x = { bg = 'None', gui = 'bold' },
        y = { bg = 'None', gui = 'bold' },
        z = { bg = 'None', gui = 'bold' },
      },
      insert = {
        a = { bg = 'None', gui = 'bold' },
        b = { bg = 'None', gui = 'bold' },
        c = { bg = 'None', gui = 'bold' },
        x = { bg = 'None', gui = 'bold' },
        y = { bg = 'None', gui = 'bold' },
        z = { bg = 'None', gui = 'bold' },
      },
      visual = {
        a = { bg = 'None', gui = 'bold' },
        b = { bg = 'None', gui = 'bold' },
        c = { bg = 'None', gui = 'bold' },
        x = { bg = 'None', gui = 'bold' },
        y = { bg = 'None', gui = 'bold' },
        z = { bg = 'None', gui = 'bold' },
      },
      replace = {
        a = { bg = 'None', gui = 'bold' },
        b = { bg = 'None', gui = 'bold' },
        c = { bg = 'None', gui = 'bold' },
        x = { bg = 'None', gui = 'bold' },
        y = { bg = 'None', gui = 'bold' },
        z = { bg = 'None', gui = 'bold' },
      },
      command = {
        a = { bg = 'None', gui = 'bold' },
        b = { bg = 'None', gui = 'bold' },
        c = { bg = 'None', gui = 'bold' },
        x = { bg = 'None', gui = 'bold' },
        y = { bg = 'None', gui = 'bold' },
        z = { bg = 'None', gui = 'bold' },
      },
      inactive = {
        a = { bg = 'None', gui = 'bold' },
        b = { bg = 'None', gui = 'bold' },
        c = { bg = 'None', gui = 'bold' },
        x = { bg = 'None', gui = 'bold' },
        y = { bg = 'None', gui = 'bold' },
        z = { bg = 'None', gui = 'bold' },
      },
    }

    local mode = {
      function()
        return string.upper(vim.fn.mode())
      end,
      color = function()
        -- auto change color according to neovims mode
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { left = 2 },
    }

    local filename = {
      'filename',
      path = 1,
    }

    local branch = {
      'branch',
      icon = '',
      color = { fg = colors.violet, bg = 'None', gui = 'bold' },
      on_click = function()
        vim.cmd 'Neogit'
      end,
    }

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = { error = ' ', warn = ' ', info = ' ' },
      diagnostics_color = {
        color_error = { fg = colors.red, bg = 'None', gui = 'bold' },
        color_warn = { fg = colors.yellow, bg = 'None', gui = 'bold' },
        color_info = { fg = colors.cyan, bg = 'None', gui = 'bold' },
      },
      color = { bg = mode, gui = 'bold' },
    }
    local diff = {
      'diff',
      symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
      diff_color = {
        added = { fg = colors.green, bg = 'None' },
        modified = { fg = colors.orange, bg = 'None' },
        removed = { fg = colors.red, bg = 'None' },
      },
      cond = hide_in_width,
    }
    local buffers = {
      function()
        local bufs = vim.api.nvim_list_bufs()
        local bufNumb = 0
        local function buffer_is_valid(buf_id, buf_name)
          return 1 == vim.fn.buflisted(buf_id) and buf_name ~= ''
        end
        for idx = 1, #bufs do
          local buf_id = bufs[idx]
          local buf_name = vim.api.nvim_buf_get_name(buf_id)
          if buffer_is_valid(buf_id, buf_name) then
            bufNumb = bufNumb + 1
          end
        end

        return bufNumb
      end,
      icon = '',
      color = { fg = colors.darkblue, bg = 'None' },
      on_click = function()
        require('buffer_manager.ui').toggle_quick_menu()
      end,
    }

    local lsp_status = {
      'lsp_progress',
      colors = {
        percentage = colors.cyan,
        title = colors.cyan,
        message = colors.cyan,
        spinner = colors.cyan,
        lsp_client_name = colors.magenta,
        use = true,
      },
      separators = {
        component = ' ',
        progress = ' | ',
        percentage = { pre = '', post = '%% ' },
        title = { pre = '', post = ': ' },
        lsp_client_name = { pre = '[', post = ']' },
        spinner = { pre = '', post = '' },
        message = { commenced = 'In Progress', completed = 'Completed' },
      },
      display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
    }

    local get_active_lsp = function()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_get_option_value('filetype', {})
      local clients = vim.lsp.get_clients { bufnr = 0 }
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end

    require('lualine').setup {
      options = {
        theme = theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
        always_divide_middle = false,
      },
      sections = {
        lualine_a = { mode, filename, get_active_lsp },
        lualine_b = { buffers, branch },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { lsp_status },
        lualine_z = { diagnostics, diff },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
