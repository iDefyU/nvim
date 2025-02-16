return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' }, -- 파일 열기 시점에 로드
  opts = {},
  config = function()
    require('conform').setup {
      --[[──────────────────────────
            🛠️ 파일 타입별 포매터 설정
      ────────────────────────────]]
      formatters_by_ft = {
        lua = { 'stylua' }, -- Lua 포매터
        python = { 'isort', 'black' }, -- 다중 포매터 순차 실행
        rust = {
          'rustfmt', -- Rust 기본 포매터
          lsp_format = 'fallback', -- LSP 포매팅 폴백
        },
        javascript = {
          'prettierd', -- Prettier 데몬 버전
          'prettier', -- 일반 Prettier
          stop_after_first = true, -- 첫 성공 포매터에서 중단
        },
        -- 추가 파일 타입 예시:
        go = { 'gofumpt', 'goimports' },
        json = { 'jq' },
      },

      --[[──────────────────────────
            ⚙️ 자동 포매팅 설정
      ────────────────────────────]]
      format_on_save = {
        timeout_ms = 500, -- 포매팅 최대 대기 시간(ms)
        lsp_format = 'fallback', -- LSP 우선 시도
        async = false, -- 동기식 처리(안정성 우선)
      },
    }
  end,
}
