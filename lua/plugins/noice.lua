-- lazy.nvim
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  vscode = false,

  config = function()
    require('noice').setup {
      cmdline = {
        enabled = true, -- cmdline 기능 활성화
        view = 'cmdline_popup', -- 부동 창으로 표시
        format = {
          cmdline = { title = '', icon = '' }, -- cmdline 아이콘 설정 (선택 사항)
        },
      },
      lsp = {
        override = {
          -- override the default lsp markdown formatter with Noice
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          -- override the lsp markdown formatter with Noice
          ['vim.lsp.util.stylize_markdown'] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ['cmp.entry.get_documentation'] = true,
        },
        hover = {
          enabled = false, -- this will disable hover warning
        },
        signature = {
          enabled = false, -- this will disable signtature warning.
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      routes = {},
    }
  end,
}
