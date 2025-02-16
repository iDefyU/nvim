--[[
기본 Neovim 설정 로드
- 핵심 키맵, 옵션, Neovide 전용 설정을 초기화
]]
require 'core.keymap' -- 사용자 정의 키 바인딩
require 'core.options' -- Neovim 기본 옵션 설정

-- Neovide GUI 전용 설정 (GUI 모드에서만 활성화)
if vim.g.neovide then
  require 'core.neovide_options' -- GUI 관련 그래픽 옵션 설정
end

--[[
Lazy.nvim 플러그인 매니저 초기화
- 자동 설치 로직 포함 (최초 실행시 설치 수행)
]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  -- 안정판 브랜치 클론 (성능 최적화된 필터 옵션 사용)
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Lazy.nvim 설치 실패:\n' .. out) -- 설치 오류 시 중단
  end
end
vim.opt.rtp:prepend(lazypath) -- 런타임 경로 최우선 설정

--[[
플러그인 설정 시작
- 모듈화된 플러그인 설정 파일을 개별 로드
- 플러그인 카테고리별 그룹화 주석 추가
]]
require('lazy').setup {
  --=== 파일 탐색 및 관리 ===--
  require 'plugins.nvimtree', -- 파일 트리 탐색기
  require 'plugins.telescope', -- 강력한 검색 엔진

  --=== LSP 및 개발 도구 ===--
  require 'plugins.lsp-config', -- LSP 서버 설정
  require 'plugins.autocompletion', -- 자동 완성 엔진
  require 'plugins.treesitter', -- 구문 분석 및 하이라이트
  require 'plugins.flutter-tool', -- Flutter 개발 도구
  require 'plugins.hovercraft', -- [K] 키로 문서 조회

  --=== 코드 품질 관리 ===--
  require 'plugins.conform', -- 자동 코드 포맷팅
  require 'plugins.lint', -- 실시간 코드 검사
  require 'plugins.trouble', -- 진단 메시지 관리
  require 'plugins.lsp-line', -- 진단 메세지 표시

  --=== 버전 관리 ===--
  require 'plugins.gitsign', -- Git 변경 사항 표시
  require 'plugins.fugitive', -- Git 명령어 통합
  require 'plugins.rhubarb', -- GitHub 확장 기능

  --=== UI 개선 ===--
  require 'plugins.lualine', -- 상태 바 커스터마이징
  require 'theme.theme-kanagawa-paper', -- 주력 테마 설정
  require 'plugins.hlchunk', -- 들여쓰기 가이드 라인
  require 'plugins.noice', -- 고급 알림 시스템

  --=== 편의 기능 ===--
  require 'plugins.autopair', -- 자동 괄호 완성
  require 'plugins.todo-comment', -- TODO 주석 추적
  require 'plugins.which-key', -- 키 바인딩 도우미
  require 'plugins.snipe', -- 빠른 버퍼 이동
}
