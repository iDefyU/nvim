return {
  'rjshkhr/shadow.nvim',
  dependencies = { -- 필요한 의존성 (옵션)
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  opts = {
    -- 기본 설정 (원하는 값으로 수정)
    blur = {
      enabled = true, -- 블러 효과 사용 여부
      size = 50, -- 블러 강도 (Linux/Mac만 지원)
    },
    width = 10, -- 그림자 너비 (기본: 10)
    direction = 'right', -- 그림자 방향 (left/right)
    ignore = { -- 그림자 비활성화할 창 타입
      terminal = true, -- 터미널 창
      popupmenu = false,
    },
  },
  config = function(_, opts)
    require('shadow').setup(opts) -- 설정 적용

    -- 특정 창에만 그림자 적용 (예: 플로팅 창)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'alpha', -- Alpha 시작 화면
      callback = function()
        require('shadow').show()
      end,
    })
  end,
}
