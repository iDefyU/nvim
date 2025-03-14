--[[──────────────────────────
        🌟 기본 UI 설정
────────────────────────────]]
vim.wo.number = true -- 절대 줄 번호 표시
vim.o.relativenumber = true -- 상대 줄 번호 활성화
vim.o.numberwidth = 4 -- 줄 번호 컬럼 너비
vim.wo.signcolumn = 'yes' -- 사이드 여백 항상 표시
vim.o.cursorline = true -- 현재 커서 라인 강조
vim.o.cmdheight = 1 -- 명령줄 높이 설정
vim.o.showmode = false -- INSERT 모드 표시 비활성화
vim.o.pumheight = 10 -- 자동완성 팝업 최대 높이
vim.o.conceallevel = 0 -- 마크다운 특수기호 표시

--[[──────────────────────────
        🖥️ 디스플레이 설정
────────────────────────────]]
vim.o.wrap = false -- 긴 줄 자르기 표시
vim.o.linebreak = true -- 단어 단위 줄바꿈
vim.o.scrolloff = 4 -- 스크롤 여백(상하)
vim.o.sidescrolloff = 8 -- 스크롤 여백(좌우)
vim.opt.termguicolors = true -- 트루컬러 지원 활성화
vim.o.splitbelow = true -- 수평 분할 시 아래로
vim.o.splitright = true -- 수직 분할 시 오른쪽으로

--[[──────────────────────────
        ⌨️ 편집 설정 (수정 완료)
────────────────────────────]]
vim.o.autoindent = true -- 자동 들여쓰기
vim.o.smartindent = true -- 스마트 들여쓰기
vim.o.expandtab = false -- 탭을 공백으로 변환하지 않음
vim.o.shiftwidth = 2 -- 들여쓰기 크기 (탭 1개)
vim.o.tabstop = 2 -- 탭 당 표시 너비
vim.o.softtabstop = 2 -- 편집 시 탭 간격
vim.o.mouse = 'a' -- 모든 모드에서 마우스 지원
vim.o.breakindent = true -- 줄 바꿈 시 들여쓰기 유지
--[[──────────────────────────
        🔍 검색/대체 설정
────────────────────────────]]
vim.o.hlsearch = false -- 검색 하이라이트 비활성화
vim.o.ignorecase = true -- 대소문자 구분 없음
vim.o.smartcase = true -- 대문자 포함 시 구분 활성화

--[[──────────────────────────
        ⚙️ 고급 설정
────────────────────────────]]
vim.o.clipboard = 'unnamedplus' -- 시스템 클립보드 공유
vim.o.swapfile = false -- 스왑 파일 생성 비활성화
vim.o.undofile = true -- 실행 취소 기록 저장
vim.o.updatetime = 250 -- 플러그인 반응 속도(ms)
vim.o.timeoutlen = 300 -- 키맹 대기 시간(ms)
vim.o.fileencoding = 'utf-8' -- 파일 인코딩 설정
vim.o.backspace = 'indent,eol,start' -- 백스페이스 동작

--[[──────────────────────────
        📑 완성 관련 설정
────────────────────────────]]
vim.o.completeopt = 'menuone,noselect' -- 자동완성 동작
vim.opt.shortmess:append 'c' -- 완성 메시지 간소화

--[[──────────────────────────
        🛠️ 기타 설정
────────────────────────────]]
vim.opt.iskeyword:append '-' -- 검색 시 하이픈 인식
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- 자동 주석 비활성화
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Vim 경로 제거

--[[──────────────────────────
        🩺 진단 설정
────────────────────────────]]
vim.diagnostic.config {
  virtual_text = false, -- 실시간 오류 텍스트 표시 비활성화
}

vim.o.whichwrap = 'bs<>[]hl' -- 화살표 키로 줄 이동 허용
vim.o.showtabline = 0 -- 상단 탭 바 표시 안함
vim.o.backup = false -- 백업 파일 생성 비활성화
vim.o.writebackup = false -- 외부 편집 방지 기능
