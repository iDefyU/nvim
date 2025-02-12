require 'core.keymap'
require 'core.options'

if vim.g.neovide then
  require 'core.neovide_options'
end

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }

  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.nvimtree',
  require 'plugins.lsp-config',
  require 'plugins.telescope', -- 찾기
  require 'plugins.autocompletion', -- 자동완성
  require 'plugins.treesitter', -- 구문 강조
  require 'plugins.flutter-tool', -- flutter tool
  require 'plugins.conform', -- 포멧터
  require 'plugins.which-key', -- 단축키
  require 'plugins.lint', -- 코드
  require 'plugins.lualine', -- 하단바
  require 'plugins.gitsign', -- Git
  require 'plugins.trouble', -- 오류 관리
  require 'plugins.fugitive', -- Git 명령어
  require 'plugins.rhubarb', -- ??
  require 'plugins.autopair', --  블럭 만들기
  require 'plugins.todo-comment', -- todoo 쫓아 다니기
  require 'plugins.indent',
  require 'plugins.noice',
  require 'plugins.lsp-line', -- 오류 화면 표시
  require 'plugins.hovercraft', --- [K]
  require 'plugins.snipe', -- 버퍼 관리
  require 'theme.theme-catppuccin', -- Theme
}
