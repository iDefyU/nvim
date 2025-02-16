return {
  'shellRaining/hlchunk.nvim',
  event = 'VeryLazy', -- 늦은 로딩
  opts = {
    -- 기본 모듈 설정
    blank = {
      enable = false, -- 빈 줄 하이라이트 비활성화
    },
    chunk = {
      enable = true,
      notify = false, -- 대용량 파일 경고 끄기
    },
  },
  config = function(_, opts)
    require('hlchunk').setup(opts)
  end,
}
