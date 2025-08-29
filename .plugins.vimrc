" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
let g:gruvbox_contrast_dark='hard'

Plugin 'YouCompleteMe'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_string=1
let g:ycm_confirm_extra_conf=0
let g:syntastic_c_checkers=['make']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '⚠'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*gbar

" Latex
let g:tex_flavor = 'latex'

" All of your Plugins must be added before the following line
call vundle#end()            " required

