local plugin = { "neovim/nvim-lspconfig" }
plugin.dependencies = {
  -- Automatically install LSPs and related tools to stdpath for neovim
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  -- Useful status updates for LSP.
  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  { "j-hui/fidget.nvim", opts = {} },
}
function plugin.config()
  -- pulled from lsp documentation
  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functins
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc ="[G]oto [D]eclaration"})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc="[G]oto [D]efinition"})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc ="hover [K]nowlage"})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc="[G]oto [I]mplementation"})
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf})
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf})
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf})
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { buffer = ev.buf})
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = ev.buf})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[R]e[N]ame"})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[C]ode [A]ction"})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc="[G]et [R]eferences"})
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, { buffer = ev.buf, desc="[F]ormat code"})
    end,
  })
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
  local servers = {
    clangd = {},
    rust_analyzer = {},
    jdtls = {},
    kotlin_language_server = {},
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          },
        },
      },
    },
    zls = {},
    marksman = {},
  }
  require("mason").setup()

  -- You can add other tools here that you want Mason to install
  -- for you, so that they are available from within Neovim.
  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    "stylua", -- Used to format lua code
    "checkstyle",
    "java-debug-adapter",
  })
  require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

  require("mason-lspconfig").setup({
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        -- This handles overriding only values explicitly passed
        -- by the server configuration above. Useful when disabling
        -- certain features of an LSP (for example, turning off formatting for tsserver)
        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
        require("lspconfig")[server_name].setup(server)
      end,
    },
  })
end
return plugin
