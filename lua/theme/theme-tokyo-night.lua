return {
  'folke/tokyonight.nvim',
  lazy = false, -- 시작 시 바로 로드
  priority = 1000, -- 다른 플러그인보다 먼저 로드
  opts = {
    -- 테마 스타일 설정 (기본값: "night")
    style = 'storm', -- "storm", "day", "moon" 중 선택 가능
    transparent = true, -- 투명 배경 사용 여부
    terminal_colors = true, -- 터미널 색상 통합

    -- 사용자 정의 하이라이트 (비주얼 모드 색상 변경)
    on_highlights = function(hl, _)
      hl.Visual = {
        bg = '#334152', -- GUI 배경색
        fg = '#FFFFFF', -- GUI 전경색
        ctermbg = 236, -- 터미널 배경색
        ctermfg = 15, -- 터미널 전경색
      }
    end,
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight' -- 테마 적용
  end,
}
