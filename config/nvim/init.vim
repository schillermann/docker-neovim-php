filetype plugin on
set omnifunc=syntaxcomplete#Complete

packloadall

lua require('plugins.lspconfig')
lua require('plugins.completion')
