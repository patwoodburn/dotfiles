local plugin = { "hrsh7th/nvim-cmp" }
local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲"
}
plugin.event = "InsertEnter"
plugin.dependencies = {
  -- Snippet Engine & its associated nvim-cmp source
  {
    "L3MON4D3/LuaSnip",
    build = (function()
      -- Build Step is needed for regex support in snippets
      -- This step is not supported in many windows environments
      -- Remove the below condition to re-enable on windows
      if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
        return
      end
      return "make install_jsregexp"
    end)(),
  },
  "saadparwaiz1/cmp_luasnip",

  -- Adds other completion capabilities.
  --  nvim-cmp does not ship with all sources by default. They are swplit
  --  into multiple repos for maintenance purposes.
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  -- If you want to add a bunch of pre-configured snippets,
  --    you can use this plugin to help you. It even has snippets
  --    for various frameworks/libraries/etc. but you will have to
  --    set up the ones that are useful for you.
  -- 'rafamadriz/friendly-snippets',
}
function plugin.config ()
			--See `:help cmp`
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  luasnip.config.setup({})

  cmp.setup({
    formating = {
      format = function(entry, vim_item)
-- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
      end
    },
    window={
      completion = {
        scrollbar = false,
        side_padding = 1,
        winhighlight = "Normal:CmpPmenu,CursorLine:Visual,Search:None,FloatBorder:CmpBorder",
        border = "single",
      },
      documentation = {
        border = "single",
        winhighlight = "normal:CmpDoc,FloatBorder:CmpDocBorder"
      },
    },
				snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				["<C-n>"] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				-- Manually trigger a completion from nvim-cmp.
				--  Generally you don't need this, because nvim-cmp will display
				--  completions whenever it has completion options available.
				["<C-Space>"] = cmp.mapping.complete({}),

				-- Think of <c-l> as moving to the right of your snippet expansion.
				--  So if you have a snippet that's like:
				--  function $name($args)
				--    $body
				--  end
				--
				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_test_item({ behavior = cmp.SelectBehavior.Select })
						end
						cmp.confirm()
					else
						fallback()
					end
				end, { "i", "s" }),
				}),
				sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
        { name = "nvim_lsp_signature_help" },
				},
			})
end
return plugin
