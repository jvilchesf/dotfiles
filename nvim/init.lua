equire 'core.options'
require 'core.keymaps'


local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
	require 'plugins.neotree',
	require 'plugins.colortheme',
	require 'plugins.bufferline',
	require 'plugins.lualine',
	require 'plugins.treesitter',
	require 'plugins.telescope',
	require 'plugins.lsp',
	require 'plugins.vim-tmux-navigator',
	require 'plugins.indent-blankline',
	require 'plugins.gitsigns',
	require 'plugins.alpha',
	require 'plugins.autocompletition',
    require 'plugins.dressing-nvim',
    require 'plugins.rustaceanvim',
    require 'plugins.debug',
})
