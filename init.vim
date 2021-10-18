source $HOME/.config/nvim/vim-plug/plugins.vim

" -------------------------------------------------------------------------------------------------
" ---------------------------------------Vim Built-in----------------------------------------------
" -------------------------------------------------------------------------------------------------
map <A-q> :q<CR>
map <A-w> :wq<CR>
set wrapmargin=1
set relativenumber
set number
set termguicolors
let mapleader = ","
map j jzz
map k kzz
map J 10jzz
map K 10kzz
map <Leader><Leader>t :tabnew<CR>

" -------------------------------------------------------------------------------------------------
" ------------------------------------------Themes-------------------------------------------------
" -------------------------------------------------------------------------------------------------

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" -------------------------------------------------------------------------------------------------
" --------------------------------------Window Movement--------------------------------------------
" -------------------------------------------------------------------------------------------------

map <Leader>H :wincmd H<CR>
map <Leader>J :wincmd J<CR>
map <Leader>K :wincmd K<CR>
map <Leader>L :wincmd L<CR>
map <Leader>h :wincmd h<CR>
map <Leader>j :wincmd j<CR>
map <Leader>k :wincmd k<CR>
map <Leader>l :wincmd l<CR>
map <Leader>n :bnext <CR>
map <Leader>wh :VimwikiAll2HTML <CR>
map <Leader>wb :Vimwiki2HTMLBrowse <CR>

" -------------------------------------------------------------------------------------------------
" -------------------------------------Unsorted Bindings-------------------------------------------
" -------------------------------------------------------------------------------------------------

map <F5> :NERDTreeToggle<CR>
map <F12> :MinimapToggle<CR>
map <F6> :Files<CR>
map P :Goyo <CR>

" -------------------------------------------------------------------------------------------------
" ------------------------------------------Plugins------------------------------------------------
" -------------------------------------------------------------------------------------------------

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'https://github.com/junegunn/fzf.vim.git'
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'https://github.com/vim-airline/vim-airline.git'
    Plug 'https://github.com/airblade/vim-gitgutter.git'
    Plug 'https://github.com/lervag/vimtex.git'
    Plug 'https://github.com/junegunn/goyo.vim.git'
    Plug 'https://github.com/tpope/vim-fugitive.git'
    Plug 'https://github.com/vimwiki/vimwiki.git'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'https://github.com/BurntSushi/ripgrep.git'
    Plug 'ekickx/clipboard-image.nvim'
    Plug 'https://github.com/mattn/emmet-vim.git'
    Plug 'https://github.com/easymotion/vim-easymotion.git'
call plug#end()

map <Leader><Leader>pc :PlugClean<CR>
map <Leader><Leader>pi :PlugInstall<CR>


" -------------------------------------------------------------------------------------------------
" ------------------------------------------Filexplorer--------------------------------------------
" -------------------------------------------------------------------------------------------------

nmap <space>e <Cmd>CocCommand explorer<CR>

" -------------------------------------------------------------------------------------------------
" --------------------------------------------VimWiki----------------------------------------------
" -------------------------------------------------------------------------------------------------
let g:vimwiki_list = [{'path': '~/Writing/VimWiki', 'path_html':'~/Writing/VimWiki_html'}]
let g:vimwiki_list = [{'path': '~/Writing/VimWiki_html/', 'auto_export': 1}]
let g:vimwiki_list = [{'path': '~/Writing/VimWiki/', 'auto_toc': 1}]
let g:vimwiki_list = [{'path': '~/Writing/VimWiki', 'index': 'index'}]
autocmd BufWritePost *.wiki :Vimwiki2HTMLBrowse
autocmd BufWritePost index.wiki :VimwikiAll2HTML

" -------------------------------------------------------------------------------------------------
" --------------------------------------Fuzzy File Search------------------------------------------
" -------------------------------------------------------------------------------------------------
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

" -------------------------------------------------------------------------------------------------
" ------------------------------------------Minimap------------------------------------------------
" -------------------------------------------------------------------------------------------------

let g:minimap_width = 25
let g:minimap_highlight_range = 1
let g:minimap_highlight = "Folded"
let g:minimap_base_highlight = "PmenuSel"

" -------------------------------------------------------------------------------------------------
" ------------------------------------------Focus Mode---------------------------------------------
" -------------------------------------------------------------------------------------------------

let g:Goyo_width = "85%"

" -------------------------------------------------------------------------------------------------
" --------------------------------------Insert Mode Mappings---------------------------------------
" -------------------------------------------------------------------------------------------------

imap jj <ESC>
imap kk <ESC>

" -------------------------------------------------------------------------------------------------
" ----------------------------------------LaTeX Bindings-------------------------------------------
" -------------------------------------------------------------------------------------------------

autocmd FileType tex nmap <buffer> <Leader>p :LatexPreviewToggle<CR>
autocmd FileType tex map <buffer> <Leader>[ :PrevLatexPreviewMode<CR>
autocmd FileType tex map <buffer> <Leader>] :NextLatexPreviewMode<CR>
autocmd FileType tex noremap <space><space> /<++><CR>dgni

" -------------------------------------------------------------------------------------------------
" ------------------------------------------EasyMotion---------------------------------------------
" -------------------------------------------------------------------------------------------------

nmap <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>f <Plug>(easymotion-bd-f)

" -------------------------------------------------------------------------------------------------
" ----------------------------------------------CoC------------------------------------------------
" -------------------------------------------------------------------------------------------------

" coc.nvim default settings
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<S-TAB>" :
      \ coc#refresh()
inoremap <expr><TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
"""vmap <leader>f  <Plug>(coc-format-selected)
"""nmap <leader>f  <Plug>(coc-format-selected)
""" Show all diagnostics
""nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
""" Manage extensions
""nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
""" Show commands
""nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
""" Find symbol of current document
""nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
""" Search workspace symbols
""nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
""" Do default action for next item.
""nnoremap <silent> <space>j  :<C-u>CocNext<CR>
""" Do default action for previous item.
""nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
""" Resume latest coc list
""nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


