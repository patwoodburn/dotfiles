-- basic options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.timeout = false
vim.o.ttimeout = false
-- nice line numbers
vim.o.number = true
vim.o.relativenumber = true

-- end of intented line column
vim.o.ruler = true
-- vim.o.t_Co = 256
-- vim.o.cc = 79
vim.cmd[[highlight ColorColumn ctermbg=9]]

vim.o.cursorline = true

-- don't save dumb files
vim.g.noswapfile = true

-- nice braces
vim.o.showmatch = true
-- vim.o.matchParen = true

vim.o.spell = true

-- don't double info
vim.o.showmode = false

-- better clipboard
vim.o.clipboard = 'unnamedplus'

-- confterble function writing
vim.o.breakindent = true

-- undo history
vim.o.undofile = true

-- better search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- colmn for signs
vim.o.signcolumn = 'yes'

-- update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- better scrolling
--vim.o.so=999

-- tabs and white space
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoindent = true

-- better splits
vim.keymap.set("n", "<C-J> ", "<C-W><C-J>", {noremap=true})
vim.keymap.set("n", "<C-K> ", "<C-W><C-K>", {noremap=true})
vim.keymap.set("n", "<C-L> ", "<C-W><C-L>", {noremap=true})
vim.keymap.set("n", "<C-H> ", "<C-W><C-H>", {noremap=true})


-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup{
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
      })
    end
  },
  {
    'dracula/vim',
    lazy = false,
    config = function()
      -- silent! colorscheme dracula
      vim.cmd.colorscheme 'dracula'
    end
  },
  {
    'vim-airline/vim-airline',
    event = VimEnter,
    dependencies = {
      'vim-airline/vim-airline-themes',
      --let g:localvimrc_sandbox=0
      --let g:localvimrc_ask=0

    },
    config = function()
      vim.o.laststatus = 2
      vim.g['airline#extensions#tabline#enable'] = 1
      vim.g['airline#_powerline_fonts'] = 1
      vim.g['airline#extensions#enable'] = 1
      vim.g['localvimrc_sandbox'] = 0
      vim.g['localvimrc_ask'] = 0
    end,
  },
  'junegunn/limelight.vim',
  'junegunn/goyo.vim',
  'bronson/vim-trailing-whitespace',
  'terryma/vim-multiple-cursors',
  {
    'nvim-telescope/telescope.nvim',
    event = VimEnter,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('telescope').setup{
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    end
  },
  'nvim-telescope/telescope-file-browser.nvim',
  {
    'ThePrimeagen/harpoon', 
    branch = 'harpoon2',
    config = function()
      -- harpoon config largly authors config until i decide otherwise
      local harpoon = require('harpoon')
      harpoon:setup({})
      vim.keymap.set("n", "<leader>hs", ":Telescope harpoon marks<Cr>", {noremap=true})
      vim.keymap.set("n", "<leader>ha", function ()
        harpoon:list():append()
      end, {noremap=true})
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-p>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-n>", function() harpoon:list():next() end)
      vim.keymap.set("n", "<leader>hr", function ()
        harpoon:list():remove()
      end, {noremap=true})
    end
  },
  'folke/lsp-colors.nvim',
  {
    'folke/trouble.nvim',
    event = VimEnter,
    config = function()
      require("trouble").setup({})
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
     -- Automatically install LSPs and related tools to stdpath for neovim
     'williamboman/mason.nvim',
     'williamboman/mason-lspconfig.nvim',
     'WhoIsSethDaniel/mason-tool-installer.nvim',

     -- Useful status updates for LSP.
     -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
     { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      -- pulled from lsp documentation
      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local servers = {
        rust_analyzer = {},
      }
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- If you want to add a bunch of pre-configured snippets,
      --    you can use this plugin to help you. It even has snippets
      --    for various frameworks/libraries/etc. but you will have to
      --    set up the ones that are useful for you.
      -- 'rafamadriz/friendly-snippets',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },
}
