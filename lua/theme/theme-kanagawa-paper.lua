return {
  'thesimonho/kanagawa-paper.nvim',
  lazy = false, -- 시작 시 즉시 로드
  priority = 1000, -- 높은 우선순위
  opts = {
    -- 기본 테마 설정 (paper 스타일 강조)
    theme = 'paper', -- 기본값: "kanagawa" 스타일 변형
    transparent = false, -- 투명 배경
    dimInactive = true, -- 비활성 창 어둡게

    -- 사용자 정의 하이라이트 오버라이드
    overrides = function(colors)
      local palette = colors.palette
      return {
        -- 커서 라인 강조
        -- CursorLine = { bg = palette.sumiInk3 },
        -- 검색 하이라이트
        -- Search = { bg = palette.autumnYellow, fg = palette.sumiInk0 },
      }
    end,
  },
  config = function(_, opts)
    require('kanagawa-paper').setup(opts) -- 설정 적용
    vim.cmd.colorscheme 'kanagawa-paper' -- 테마 활성화
  end,
}
