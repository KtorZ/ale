call ale#Set('haskell_fourmolu_executable', 'fourmolu')

function! ale#fixers#fourmolu#GetProjectRoot(buffer) abort
    let l:fourmolu_config = ale#path#FindNearestFile(a:buffer, 'fourmolu.yaml')

    return !empty(l:fourmolu_config) ? fnamemodify(l:fourmolu_config, ':h') : ''
endfunction


function! ale#fixers#fourmolu#Fix(buffer) abort
    let l:executable = ale#Var(a:buffer, 'haskell_fourmolu_executable')

    return {
    \   'cwd': ale#fixers#fourmolu#GetProjectRoot(a:buffer),
    \   'command': ale#Escape(l:executable)
    \       . ' -i'
    \       . ' %t',
    \   'read_temporary_file': 1,
    \}
endfunction
