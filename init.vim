" main
set noswapfile
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set nu
set relativenumber
set termguicolors
set scrolloff=15

" pligins
call plug#begin(stdpath('config') . "/autoload/plugged")

Plug 'voldikss/vim-floaterm'
Plug 'joshdick/onedark.vim'
Plug 'vimsence/vimsence'
Plug 'wakatime/vim-wakatime'
Plug 'nvim-lua/plenary.nvim'
Plug 'rowario/telescope.nvim', {'branch': 'trim-text-option'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
" Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'

call plug#end()

" keymap
let mapleader=";"

inoremap jk <esc>
nnoremap <F3> :noh<CR>
nnoremap <leader>ff <cmd>Telescope find_files initial_mode=normal hidden=true<cr>
nnoremap gr <cmd>Telescope lsp_references trim_text=true<cr>

nnoremap <leader>ft <cmd>FloatermToggle<cr>
tnoremap <leader>ft <C-\><C-n>:FloatermToggle<cr>
tnoremap <leader>fn <cmd>FloatermNew<cr>
tnoremap <leader>tn <cmd>FloatermNext<cr>
tnoremap <leader>tp <cmd>FloatermPrev<cr>
tnoremap <leader>tk <cmd>FloatermKill<cr>

" others
colorscheme onedark 
hi Normal guibg=none ctermbg=none
hi FloatermBorder guibg=none guifg=none
" vimsence
let g:vimsence_client_id = '439476230543245312' 
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'

lua require("rowario")
