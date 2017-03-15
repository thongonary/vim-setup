" Toggle mouse plugin for quickly toggling mouse between Vim and terminal
" Maintainer:   Thong Nguyen <thong.nguyen@cern.ch>
" Version:      Vim 7 (may work with lower Vim versions, but not tested)
" URL:          https://github.com/thongonary/vim-setup
"
" Only do this when not done yet for this buffer
if exists("b:loaded_toggle_mouse_plugin")
    finish
endif
let b:loaded_toggle_mouse_plugin = 1

fun! s:ToggleMouse() 
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction 

" Add mappings  
if !exists("no_plugin_maps") && !exists("no_toggle_mouse_maps")
    if !hasmapto('<SID>ToggleMouse()')
        nnoremap <Leader>m :call <SID>ToggleMouse()<CR>
    endif
endif
