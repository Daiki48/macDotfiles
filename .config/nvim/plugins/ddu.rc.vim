" hook_sourceの中身
call ddu#custom#patch_global({
	\	'ui': 'filer',
	\	'sources': [
	\		{
	\			'name': 'file',
	\			'params': {},
	\		}
	\	],
	\	'sourceOptions': {
		\		'_': {
			\		'columns': ['filename'],
			\	},
	\	},
	\	'kindOptions': {
		\	'file': {
			\	'defaultAction': 'open',
		\	},
	\	},
	\	'uiParams': {
		\	'filer': {
			\	'split': 'floating',
		\	}
	\	},
	\	})

autocmd FileType ddu-filer call s:ddu_my_settings()

function! s:ddu_my_settings() abort
	nnoremap <buffer><silent> <CR>
				\	<Cmd>call ddu#ui#filer#do_action('itemAction')<CR>
	nnoremap <buffer><silent> <Space>
				\	<Cmd>call ddu#ui#filer#do_action('toggleSelectItem')<CR>
	nnoremap <buffer> o
				\	<Cmd>call ddu#ui#filer#do_action('expandItem',
				\	{'mode': 'toggle'})<CR>
	nnoremap <buffer><silent> q
				\	<Cmd>call ddu#ui#filer#do_action('quit')<CR>
endfunction

" 起動コマンド
map <silent> fo <Cmd>call ddu#start({})<CR>
