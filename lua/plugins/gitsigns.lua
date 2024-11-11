return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = { text = "" }, -- 추가된 라인 (플러스)
            change = { text = "" }, -- 변경된 라인 (펜)
            delete = { text = "" }, -- 삭제된 라인 (X)
            topdelete = { text = "" }, -- 위쪽에서 삭제된 라인 (X)
            changedelete = { text = "" }, -- 변경된 후 삭제된 라인 (번개)
        },
        signs_staged = {
            add = { text = "" }, -- 스테이징된 추가된 라인 (플러스)
            change = { text = "" }, -- 스테이징된 변경된 라인 (펜)
            delete = { text = "" }, -- 스테이징된 삭제된 라인 (X)
            topdelete = { text = "" }, -- 스테이징된 위쪽 삭제 (X)
            changedelete = { text = "" }, -- 스테이징된 변경 후 삭제된 라인 (번개)
        },
    },
}
