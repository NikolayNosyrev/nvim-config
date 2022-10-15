-- require('settings')



-- nvim-tree setuplocal map = vim.api.nvim_set_keymap
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
map('n', '<C-n>', ':NvimTreeToggle<CR>',  default_opts)

local node_live_grep = function(node)
    require'telescope.builtin'.live_grep{cwd=node.absolute_path,shorten_path=true}
end

local node_find_files = function(node)
    require'telescope.builtin'.find_files{cwd=node.absolute_path,shorten_path=true}
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    -- adaptive_size = true,
    width = 55,
    mappings = {
      list = {
        { key = "<C-k>", action = "" },
        { key = "<Tab>", action = "" },
        { key = "<A-;>", action = "node_live_grep", action_cb = node_live_grep },
        { key = ";", action = "node_find_files", action_cb = node_find_files }
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false
  }
})

-- barbar.nvim
require'bufferline'.setup {
  -- Enable/disable animations
  animation = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  insert_at_end = true,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = true,

  icons = 'both',

  closable = false,

  icon_separator_active = '',
  icon_separator_inactive = '',

  maximum_padding = 2,
  minimum_padding = 2
}

map('n', '<A-h>', ':BufferPrevious<CR>', default_opts)
map('n', '<A-l>', ':BufferNext<CR>', default_opts)
map('n', '<A-d>', ':BufferClose<cr>', default_opts)
map('i', '<A-h>', '<Esc>:BufferPrevious<CR>', default_opts)
map('i', '<A-l>', '<Esc>:BufferNext<CR>', default_opts)
map('i', '<A-d>', '<Esc>:BufferClose<cr>', default_opts)

map('n', '<A-Left>', ':BufferMovePrevious<cr>', default_opts)
map('n', '<A-Right>', ':BufferMoveNext<cr>', default_opts)

map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', default_opts)
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', default_opts)
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', default_opts)
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', default_opts)
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', default_opts)
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', default_opts)
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', default_opts)
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', default_opts)
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', default_opts)
map('n', '<leader>0', '<Cmd>BufferGoto 10<CR>', default_opts)
map('n', 'f', '<Cmd>BufferPick<CR>', default_opts)


-- telescope
map('n', ';', ':Telescope find_files<CR>', default_opts)
map('n', '<A-;>', ':Telescope live_grep<CR>', default_opts)
map('n', '\'', ':Telescope buffers<CR>', default_opts)
map('n', '<A-i>', ':Telescope treesitter<CR>', default_opts)
map('n', 'gr', ':Telescope lsp_references<CR>', default_opts)
map('n', '<C-]>', ':Telescope lsp_definitions<CR>', default_opts)

-- other
map('n', '<tab>', '<C-w><C-w>', default_opts)


------------------------ settings -----------------------------------

local opt = vim.opt

vim.cmd 'set nowrap'

opt.cursorline = true               -- Подсветка строки с курсором
opt.number = true                   -- Включаем нумерацию строк
-- opt.spelllang= { 'en_us', 'ru' }    -- Словари рус eng
opt.colorcolumn = '120'
-- opt.so=999                          -- Курсор всегда в центре экрана


opt.termguicolors = true
vim.cmd 'colorscheme darcula-solid'

opt.mouse = 'a'

-- установить keymap, чтобы по Ctrl+^ переключалась раскладка клавиатуры при вводе текста на русский и обратно внутри самого редактора
opt.keymap = 'russian-jcukenwin'
map('i', '<C-/>', '<C-^>', default_opts)
-- по умолчанию латинская раскладка
opt.iminsert = 0
opt.imsearch = 0

-- Дополнительная информация в строке состояния
opt.wildmenu = true

-- Перемещение
map('n', '<A-j>', '10j', default_opts)
map('x', '<A-j>', '10j', default_opts)
map('n', '<A-k>', '10k', default_opts)
map('x', '<A-k>', '10k', default_opts)


map('n', '<C-j>', '7<C-e>', default_opts)
map('n', '<C-k>', '7<C-y>', default_opts)

map('n', '<C-l>', '7zl', default_opts)
map('n', '<C-h>', '7zh', default_opts)


-- выход
map('n', '<A-q>', '<Esc>:qa<cr>', default_opts)
map('v', '<A-q>', '<Esc>:qa<cr>', default_opts)
map('i', '<A-q>', '<Esc>:qa<cr>', default_opts)

-- ctrl+s - сохранить 
map('n', '<A-s>', ":wa<cr>:echo 'Saved!'<cr>", default_opts)
map('i', '<A-s>', "<esc>:wa<cr>:echo 'Saved!'<cr>", default_opts)

-- перемещение по методам
map('n', '<A-n>', ":call search(' function ', \"w\")<CR>ww", default_opts)
map('n', '<A-u>', ":call search(' function ', \"bwz\")<CR>ww", default_opts)

-- инициировать поиск по ctrl+f
map('x', '<C-f>', 'y0/<C-r>"<cr>', default_opts)

-- убрать подсветку найденой строки по нажатию f6
map('n', '<F6>', ':noh<CR>', default_opts)

-- настройки tagbar-a
map('n', '<F9>', ':SymbolsOutline<CR>', default_opts)

-----------------------------------------------------------
-- Табы и отступы
-----------------------------------------------------------
vim.cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.softtabstop = 4
opt.smartindent = true    -- autoindent new lines

-----------------------------------------------------------
-- Выререзать-вставить
-----------------------------------------------------------

-- vnoremap <C-c> "*y :let @+=@*<CR>h
map('v', '<C-c>', '"*y :let @+=@*<CR>h', default_opts)
-- vnoremap <C-x> "+c
map('v', '<C-x>', '"+c', default_opts)
-- vnoremap <C-v> c<ESC>"+p
map('v', '<C-v>', 'c<ESC>"+p', default_opts)
-- imap <C-v> <C-r><C-o>+
map('i', '<C-v>', '<C-r><C-o>+', default_opts)
-- cmap <C-v> <C-r><C-o>+
--map('c', '<C-v>', '<C-r><C-o>+ ', default_opts)
vim.cmd 'cmap <C-v> <C-r><C-o>+'
-- tmap <C-v> <C-\><C-n>pia<backspace>
map('t', '<C-v>', '<C-\\><C-n>pia<backspace>', default_opts)

-- set clipboard+=unnamedplus
vim.cmd 'set clipboard+=unnamedplus'

-----------------------------------------------------------
-- Easymotion
-----------------------------------------------------------
vim.cmd 'let g:wordmotion_prefix = \'<Leader>\''
vim.cmd 'nmap <A-w> <Leader><Leader>w'
vim.cmd 'nmap <A-b> <Leader><Leader>b'

------------------------ settings -----------------------------------

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require'lspconfig'.intelephense.setup{}

require("nvim-lsp-installer").setup {}


----------------------- LSP

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['intelephense'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

---------------------------------------

-- local fg_current = '#262626'
-- local bg_current = '#8a8a8a'

local fg_target = 'yellow'

local fg_inactive = '#acacac'
local bg_inactive = '#3a3a3a'

local fg_visible = fg_inactive
local bg_visible = bg_inactive

local fg_current = bg_visible
local bg_current = fg_visible

vim.cmd('hi BufferCurrent guifg='..fg_current..' guibg='..bg_current)
vim.cmd('hi BufferCurrentIndex guifg='..fg_current..' guibg='..bg_current)
vim.cmd('hi BufferCurrentMod guifg='..fg_current..' guibg='..bg_current)
vim.cmd('hi BufferCurrentTarget guifg='..fg_target..' guibg='..bg_current)
vim.cmd('hi BufferCurrentSign guifg='..fg_current..' guibg='..bg_current)

vim.cmd('hi BufferVisible guifg='..fg_visible..' guibg='..bg_visible)
vim.cmd('hi BufferVisibleIndex guifg='..fg_visible..' guibg='..bg_visible)
vim.cmd('hi BufferVisibleMod guifg='..fg_visible..' guibg='..bg_visible)
vim.cmd('hi BufferVisibleTarget guifg='..fg_target..' guibg='..bg_visible)
vim.cmd('hi BufferVisibleSign guifg='..fg_visible..' guibg='..bg_visible)

vim.cmd('hi BufferInactive guifg='..fg_inactive..' guibg='..bg_inactive)
vim.cmd('hi BufferInactiveIndex guifg='..fg_inactive..' guibg='..bg_inactive)
vim.cmd('hi BufferInactiveMod guifg='..fg_inactive..' guibg='..bg_inactive)
vim.cmd('hi BufferInactiveTarget guifg='..fg_target..' guibg='..bg_inactive)
vim.cmd('hi BufferInactiveSign guifg='..fg_inactive..' guibg='..bg_inactive)

vim.cmd('hi BufferTabpageFill guibg='..bg_inactive)

------------------------------------------------------------------------------ cmp-nvim-lsp -------------

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<A-j>'] = cmp.mapping.select_next_item(),
      ['<A-k>'] = cmp.mapping.select_prev_item(),
    }),
    completion = {
      completeopt = 'menu,menuone,noinsert'
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['intelephense'].setup {
    capabilities = capabilities
  }

------------------------------------------------------------------------------ cmp-nvim-lsp -------------


------------------------------------------------------------------------------ lualine -------------

require('lualine').setup {
  sections = {
    lualine_c = {
      {
        'filename',
        path=1
      }
    },
  }
}

------------------------------------------------------------------------------ lualine -------------


------------------------------------------------------------------------------ telescope -------------

require("telescope").setup {
  defaults = {
    -- ....
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close,
        ["<C-/>"] = false,
        ["<C-v>"] = false,
        ["<A-k>"] = "move_selection_previous",
        ["<A-j>"] = "move_selection_next",
      }
    }
  },
  pickers = {
    find_files = {
      mappings = {
        n = {
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent lcd %s", dir))
          end
        }
      }
    },
  }
}

------------------------------------------------------------------------------ telescope -------------

------------------------------------------------------------------------------ toggleterm -------------
require("toggleterm").setup{
  direction = 'float',
  float_opts = {
    border = 'single'
  },
  open_mapping = [[<A-t>]],
}

------------------------------------------------------------------------------ toggleterm -------------

------------------------------------------------------------------------------ vgit -------------
-- map('n', 'xxx', ':VGit buffer_blame_preview<CR>G$', default_opts)
-- map('n', 'xxx', ':VGit buffer_blame_preview<CR>:$<cr>', default_opts)
-- vim.cmd 'nmap xxx :VGit buffer_blame_preview<CR>:ccc'

require('vgit').setup({
  keymaps = {
    ['n <F7>'] = 'toggle_live_blame',
    ['n <F8>'] = 'buffer_blame_preview'
  },
  settings = {
    hls = {
      GitBackground = 'Normal',
      GitHeader = 'NormalFloat',
      GitFooter = 'NormalFloat',
      GitBorder = 'LineNr',
      GitLineNr = 'LineNr',
      GitComment = 'Comment',
      GitSignsAdd = {
        gui = nil,
        fg = '#d7ffaf',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsChange = {
        gui = nil,
        fg = '#7AA6DA',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsDelete = {
        gui = nil,
        fg = '#e95678',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsAddLn = 'DiffAdd',
      GitSignsDeleteLn = 'DiffDelete',
      GitWordAdd = {
        gui = nil,
        fg = nil,
        bg = '#5d7a22',
        sp = nil,
        override = false,
      },
      GitWordDelete = {
        gui = nil,
        fg = nil,
        bg = '#960f3d',
        sp = nil,
        override = false,
      },
    },
    live_blame = {
      enabled = false
    },
    signs = {
      priority = 10,
      definitions = {
        GitSignsAddLn = {
          linehl = 'GitSignsAddLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '+',
        },
        GitSignsDeleteLn = {
          linehl = 'GitSignsDeleteLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '_',
        },
        GitSignsAdd = {
          texthl = 'GitSignsAdd',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '+',
        },
        GitSignsDelete = {
          texthl = 'GitSignsDelete',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '_',
        },
        GitSignsChange = {
          texthl = 'GitSignsChange',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '~',
        },
      },
      usage = {
        screen = {
          add = 'GitSignsAddLn',
          remove = 'GitSignsDeleteLn',
        },
        main = {
          add = 'GitSignsAdd',
          remove = 'GitSignsDelete',
          change = 'GitSignsChange',
        },
      },
    },
    symbols = {
      void = '⣿',
    },
  }
})
vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'
------------------------------------------------------------------------------ vgit -------------

require('nvim-autopairs').setup({
})

require("symbols-outline").setup({
  width = 20,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {}
  }
})

-- require('kyazdani42/nvim-web-devicons').setup({})
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "php", "yaml", "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  }
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-treesitter/nvim-treesitter'                                           -- Highlight, edit, and navigate code

  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  -- Автодополнялка
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  --- Автодополнлялка к файловой системе
  use 'hrsh7th/cmp-path'

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    }-- ,
    -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }

  -- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- use 'majutsushi/tagbar'
  use 'simrat39/symbols-outline.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- автоматические закрывающиеся скобки
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end}

  use 'kenn7/vim-arsync'

  use 'easymotion/vim-easymotion'

  use 'kyazdani42/nvim-web-devicons'

  use 'nelsyeung/twig.vim'

  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

  if packer_bootstrap then
    require('packer').sync()
  end
end)

