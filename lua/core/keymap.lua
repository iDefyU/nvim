-- Leader 키 설정
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 공통 옵션 설정
local opts = { noremap = true, silent = true }
local function desc_opts(description)
  return vim.tbl_extend('force', opts, { desc = description })
end

-----------------------------------------
-- 기본 편집 기능 향상
-----------------------------------------
-- 문자 삭제 시 레지스터 저장 방지
vim.keymap.set('n', 'x', '"_x', desc_opts '문자 삭제 (레지스터 저장 안함)')

-- 수직 스크롤 + 화면 중앙 정렬
vim.keymap.set('n', '<C-d>', '<C-d>zz', desc_opts '아래로 스크롤 + 중앙 정렬')
vim.keymap.set('n', '<C-u>', '<C-u>zz', desc_opts '위로 스크롤 + 중앙 정렬')

-- 검색 결과 이동 시 중앙 정렬
vim.keymap.set('n', 'n', 'nzzzv', desc_opts '다음 검색 결과 (중앙 정렬)')
vim.keymap.set('n', 'N', 'Nzzzv', desc_opts '이전 검색 결과 (중앙 정렬)')

-----------------------------------------
-- 창 크기 조절
-----------------------------------------
vim.keymap.set('n', '<Up>', ':resize -2<CR>', desc_opts '창 높이 줄이기')
vim.keymap.set('n', '<Down>', ':resize +2<CR>', desc_opts '창 높이 늘리기')
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', desc_opts '창 너비 줄이기')
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', desc_opts '창 너비 늘리기')

-----------------------------------------
-- 버퍼 관리
-----------------------------------------
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', desc_opts '현재 버퍼 닫기')
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', desc_opts '새 버퍼 생성')

-----------------------------------------
-- 진단(Diagnostics) 관련
-----------------------------------------
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, desc_opts '이전 진단 메시지')
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, desc_opts '다음 진단 메시지')
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, desc_opts '진단 상세 정보 표시')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, desc_opts '진단 목록 열기')

-----------------------------------------
-- 터미널 모드 설정
-----------------------------------------
vim.keymap.set('t', '<D-v>', '+P', desc_opts '시스템 클립보드 붙여넣기 (맥OS)')

-----------------------------------------
-- Neovide 특정 설정 (맥OS)
-----------------------------------------
if vim.g.neovide and vim.fn.has 'macunix' then
  vim.keymap.set('n', '<C-n>', ":silent exec '!/Applications/neovide.app/Contents/MacOS/neovide'<cr>", desc_opts 'Neovide 재실행')
end
