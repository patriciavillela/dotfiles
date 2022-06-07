""""""""""""""""""""""""""""""""""""""""""""""""
"""PLUGINS FOR WRITING WITHOUT NEEDING SCREEN"""
""""""""""""""""""""""""""""""""""""""""""""""""
" For writing
let wordcount=0
" Read two last phrases
nnoremap <F5> :execute "1?^.*[[:alpha:]]" <Bar> :silent execute "!echo " .. shellescape(expand(getline("."))) .. " <Bar> rev <Bar> cut -d'.' -f1,2,3 <Bar> rev <Bar> espeak -v pt+f5 -k -20 -s 150"<cr> <Bar> :execute "redraw!"<cr> <Bar> :execute "normal Go"<cr>i
inoremap <F5> <ESC>:execute "1?^.*[[:alpha:]]" <Bar> :silent execute "!echo " .. shellescape(expand(getline("."))) .. " <Bar> rev <Bar> cut -d'.' -f1,2,3 <Bar> rev <Bar> espeak -v pt+f5 -k -20 -s 150"<cr> <Bar> :execute "redraw!"<cr> <Bar> :execute "normal Go"<cr>i
" Read number of words
nnoremap <F6> :silent execute "!wc -w " .. shellescape(expand("%")) .. " <Bar> cut -f1 -d' ' <Bar> xargs -I '{}' echo '{}' palavras <Bar> espeak -v pt+f5 -k -20 -s 150"<cr> <Bar> :execute "redraw!"<cr>
inoremap <F6> <ESC>:execute "!wc -w " .. shellescape(expand("%")) .. " <Bar> cut -f1 -d' ' <Bar> xargs -I '{}' echo '{}' palavras <Bar> espeak -v pt+f5 -k -20 -s 150"<cr> <Bar> :execute "redraw!"<cr>i
" Update session word counter
nnoremap <F7> :silent let wordcount=system('wc -w ' .. shellescape(expand('%')) .. " <Bar> cut -f1 -d' ' <Bar> tr -d $'\n' & echo 'Sessão atualizada' <Bar> espeak -v pt+f5 -k 20")<cr> <Bar> :execute "redraw!"<cr>
inoremap <F7> <ESC>:let wordcount=system('wc -w ' .. shellescape(expand('%')) .. " <Bar> cut -f1 -d' ' <Bar> tr -d $'\n' & echo 'Sessão atualizada' <Bar> espeak -v pt+f5 -k 20")<cr>i
" Read session word counter
nnoremap <F8> :silent execute "!echo $(wc -w " .. shellescape(expand('%')) .. " <Bar> cut -f1 -d' ') - " .. expand(wordcount) .. " <Bar> bc <Bar> head -1 <Bar> xargs -I '{}' echo '{}' palavras escritas na última sessão <Bar> espeak -vpt+f5 -k -20 -s 150"<cr> <Bar> :execute "redraw!"<cr>
inoremap <F8> <ESC>:silent execute "!echo $(wc -w " .. shellescape(expand('%')) .. " <Bar> cut -f1 -d' ') - " .. expand(wordcount) .. " <Bar> bc <Bar> head -1 <Bar> xargs -I '{}' echo '{}' palavras escritas na última sessão <Bar> espeak -vpt+f5 -k -20 -s 150"<cr> <Bar> :execute "redraw!"<cr>i
" Say current status
nnoremap <F4> :silent execute "!echo 'Editando arquivo " .. shellescape(expand('%')) .. ". Modo normal.' <Bar> espeak -vpt+f5 -k 20"<cr> <Bar> :execute "redraw!"<cr>
inoremap <F4> <ESC>:silent execute "!echo 'Editando arquivo " .. shellescape(expand('%')) .. ". Modo de inserção.' <Bar> espeak -vpt+f5 -k 20"<cr> <Bar> :execute "redraw!"<cr>i
nnoremap <F3> :silent execute "!echo 'Comando não suportado enquanto edita arquivo' <Bar> espeak -vpt+f5 -k 20"<cr> <Bar> :execute "redraw!"<cr>
inoremap <F3> <ESC>:silent execute "!echo 'Comando não suportado enquanto edita arquivo' <Bar> espeak -vpt -k 20"<cr> <Bar> :execute "redraw!"<cr>i
