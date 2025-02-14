return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- 프로젝트 감지 로직
    local function detect_project_root()
      local current_file = vim.fn.expand '%:p'
      if current_file == '' then
        current_file = vim.fn.getcwd()
      end

      local markers = {
        '.git',
        'go.mod',
        'pubspec.yaml',
        'package.json',
        'svelte.config.js',
        'Cargo.toml',
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

    require('telescope').setup {
      defaults = {

        file_ignore_patterns = { 'node_modules', '.git', '.venv', 'build', 'target', 'dart_tool' },
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            anchor = 'NW', -- North-West (상단 왼쪽)
            width = 0.6,
            height = 0.99,
            preview_cutoff = 1,
            mirror = false,
            prompt_position = 'top', -- 프롬프트를 상단에 배치
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          cwd = detect_project_root,
          find_command = {
            'fd',
            '--type=file',
            '--hidden',
            '--exclude=.git',
            '--exclude=node_modules',
            '--exclude=.dart_tool',
            '--exclude=.pub-cache',
            '--exclude=build',
            '--exclude=target',
          },
        },
        live_grep = {
          additional_args = function(_)
            return { '--hidden', '--glob=!**/.git/*', '--glob=!**/node_modules/*' }
          end,
          cwd = detect_project_root,
        },
      },
      extensions = {
        ['ui-select'] = require('telescope.themes').get_dropdown(),
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    local keymap = vim.keymap.set

    -- 키맵 설정 (한국어 설명)
    keymap('n', '<leader>sh', builtin.help_tags, { desc = '[S] 찾기 [H] 도움말' })
    keymap('n', '<leader>sk', builtin.keymaps, { desc = '[S] 찾기 [K] 키맵' })
    keymap('n', '<leader>sf', function()
      builtin.find_files { cwd = detect_project_root() }
    end, { desc = '[S] 찾기 [F] 파일' })
    keymap('n', '<leader>ss', builtin.builtin, { desc = '[S] 찾기 [S] 텔레스코프 선택' })
    keymap('n', '<leader>sw', builtin.grep_string, { desc = '[S] 찾기 현재 [W] 단어' })
    keymap('n', '<leader>sg', function()
      builtin.live_grep { cwd = detect_project_root() }
    end, { desc = '[S] 찾기 [G] grep 검색' })
    keymap('n', '<leader>sd', builtin.diagnostics, { desc = '[S] 찾기 [D] 진단 정보' })
    keymap('n', '<leader>sr', builtin.resume, { desc = '[S] 찾기 [R] 이전 검색' })
    keymap('n', '<leader>s.', builtin.oldfiles, { desc = '[S] 찾기 최근 [F] 파일' })
    -- keymap('n', '<leader><leader>', builtin.buffers, { desc = '[ ] 기존 [B] 버퍼 찾기' })

    -- 특수 검색 기능
    keymap('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] 현재 [B] 버퍼 퍼지 검색' })

    keymap('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = '열린 파일에서 실시간 검색',
      }
    end, { desc = '[S] 찾기 [/] 열린 파일 검색' })
  end,
}
