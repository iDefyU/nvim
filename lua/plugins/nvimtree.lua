return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope.nvim', -- Telescope 의존성 추가
  },
  config = function()
    -- Telescope와 동일한 프로젝트 루트 감지 함수
    local function detect_project_root()
      local current_file = vim.fn.expand '%:p'
      if current_file == '' then
        current_file = vim.fn.getcwd()
      end

      -- 지원하는 프로젝트 마커 목록
      local markers = {
        '.git',
        'go.mod', -- Go
        'pubspec.yaml', -- Flutter
        'package.json', -- SvelteKit/Node.js
        'svelte.config.js',
        'Cargo.toml', -- Rust (추가 가능)
      }

      local function find_root(path)
        local parent = vim.fn.fnamemodify(path, ':h')
        if parent == path then
          return nil -- Root 디렉토리에 도달
        end

        for _, marker in ipairs(markers) do
          local check_path = vim.fn.glob(path .. '/' .. marker)
          if check_path ~= '' then
            return path
          end
        end

        return find_root(parent)
      end

      return find_root(vim.fn.fnamemodify(current_file, ':h')) or vim.fn.getcwd()
    end

    require('nvim-tree').setup {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = '',
          info = '',
          warning = '',
          error = '',
        },
      },
      view = {
        float = {
          enable = true,
          open_win_config = {
            relative = 'editor',
            anchor = 'NW', -- 상단 왼쪽 정렬
            width = 35,
            height = 30,
            row = 1, -- 상단 여백 조정
            col = 1, -- 왼쪽 여백 조정
          },
        },
        -- 또는 사이드바 스타일 (원하는 스타일 선택)
        --[[
        side = "left",
        width = 35,
        mappings = {
          list = {
            { key = "<C-k>", action = "dir_up" }, -- 상단 이동 단축키
          },
        },
        ]]
      },
      renderer = {
        group_empty = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          web_devicons = {
            file = {
              enable = vim.g.have_nerd_font,
              color = true,
            },
            folder = {
              enable = vim.g.have_nerd_font,
              color = true,
            },
          },

          glyphs = {
            git = {
              unstaged = '󰄱',
              staged = '󰄴',
              unmerged = '󰘫',
              renamed = '󰁔',
              untracked = '󰐗',
              deleted = '󰩧',
              ignored = '󰦝',
            },
          },
          show = {
            diagnostics = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { '^.git$' }, -- .git 폴더 숨김
      },
    }

    -- 단축키 설정 (Telescope와 통일성 유지)
    vim.keymap.set('n', '<leader>e', function()
      local current_root = detect_project_root()
      vim.cmd('lcd ' .. current_root) -- 작업 디렉토리 변경
      require('nvim-tree.api').tree.toggle { path = current_root }
    end, { desc = '[E]xplorer 토글 (프로젝트 루트)', silent = true })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'NvimTree',
      callback = function()
        vim.keymap.set('n', '<ESC>', '<cmd>NvimTreeClose<cr>', { buffer = true, silent = true })
      end,
    })
  end,
}
