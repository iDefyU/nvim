return {
  'rebelot/kanagawa.nvim',
  lazy = false, -- 시작 시 즉시 로드
  priority = 1000, -- 높은 우선순위로 로드
  opts = {
    -- 기본 테마 변형 설정 (기본값: "wave")
    theme = 'wave', -- "dragon", "lotus" 선택 가능
    transparent = false, -- 투명 배경 사용
    terminalColors = true, -- 터미널 색상 통합

    -- 사용자 정의 하이라이트 설정
    overrides = function(colors)
      local theme = colors.theme
      return {
        -- 비주얼 모드 색상 커스텀
        Visual = {
          bg = theme.ui.bg_p3, -- 더 진한 파란색 계열
          fg = theme.ui.fg,
        },
        -- 검색 하이라이트 개선
        Search = { bg = theme.syn.coral, fg = theme.ui.bg_m3 },
        -- 커서 라인 강조
        CursorLine = { bg = theme.ui.bg_m1 },
      }
    end,
  },
  config = function(_, opts)
    require('kanagawa').setup(opts) -- 설정 적용
    vim.cmd.colorscheme 'kanagawa' -- 테마 활성화
  end,
}
