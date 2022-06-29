" main
set noswapfile
set nu
set relativenumber
set termguicolors
set scrolloff=15

set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" plugins
call plug#begin(stdpath('config') . "/autoload/plugged")

Plug 'vim-autoformat/vim-autoformat'

Plug 'numToStr/Comment.nvim'

Plug 'vim-airline/vim-airline'

Plug 'voldikss/vim-floaterm'
Plug 'joshdick/onedark.vim'
Plug 'andweeb/presence.nvim'
Plug 'wakatime/vim-wakatime'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/lsp_extensions.nvim'

Plug 'L3MON4D3/LuaSnip'

Plug 'windwp/nvim-autopairs'

call plug#end()

" keymap
let mapleader=";"

inoremap jk <esc>
nnoremap <F3> :noh<CR>
nnoremap <leader>ff <cmd>Telescope find_files initial_mode=normal hidden=true<cr>
nnoremap gr <cmd>Telescope lsp_references trim_text=true<cr>

" terminal
nnoremap <leader>ft <cmd>FloatermToggle<cr>
tnoremap <leader>ft <C-\><C-n>:FloatermToggle<cr>
tnoremap <leader>fn <cmd>FloatermNew<cr>
tnoremap <leader>tn <cmd>FloatermNext<cr>
tnoremap <leader>tp <cmd>FloatermPrev<cr>
tnoremap <leader>tk <cmd>FloatermKill<cr>

" theme
colorscheme onedark
hi Normal guibg=none ctermbg=none
hi FloatermBorder guibg=none guifg=none

let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_section_z ='%p%%'

" autoformat
let g:formatdef_my_custom_cs = '"astyle --mode=cs --style=otbs --indent=tab=4 --indent=force-tab --indent-after-parens --indent-namespaces --indent-switches --indent-cases --indent-continuation=4 --indent-col1-comments --pad-oper --pad-comma --pad-header --remove-comment-prefix"'
let g:formatters_cs = ['my_custom_cs']

let g:formatters_typescriptreact = ['prettier']

nnoremap <leader>fmt <cmd>Autoformat<cr>

lua require("rowario")
