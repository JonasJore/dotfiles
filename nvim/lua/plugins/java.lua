return {
  -- Tell lspconfig to leave java alone (nvim-jdtls owns it)
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        jdtls = function()
          return true
        end,
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "java" })
    end,
  },

  -- Mason: install java tooling
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "jdtls",
        "java-debug-adapter",
        "vscode-java-test",
        "google-java-format",
      })
    end,
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.java = { "google-java-format" }
    end,
  },

  -- JDTLS
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local jdtls = require("jdtls")
      local mason_registry = require("mason-registry")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
          local debug_path = mason_registry.get_package("java-debug-adapter"):get_install_path()
          local test_path = mason_registry.get_package("vscode-java-test"):get_install_path()

          local bundles = {}
          vim.list_extend(
            bundles,
            vim.split(
              vim.fn.glob(debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
              "\n",
              { trimempty = true }
            )
          )
          vim.list_extend(
            bundles,
            vim.split(vim.fn.glob(test_path .. "/extension/server/*.jar"), "\n", { trimempty = true })
          )

          local os_config = vim.fn.has("mac") == 1 and "config_mac" or "config_linux"
          local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
          local workspace = vim.fn.stdpath("cache") .. "/jdtls/workspaces/" .. project

          jdtls.start_or_attach({
            cmd = {
              "java",
              "-Declipse.application=org.eclipse.jdt.ls.core.id1",
              "-Dosgi.bundles.defaultStartLevel=4",
              "-Declipse.product=org.eclipse.jdt.ls.core.product",
              "-Dlog.protocol=true",
              "-Dlog.level=ALL",
              "-Xmx2g",
              "--add-modules=ALL-SYSTEM",
              "--add-opens",
              "java.base/java.util=ALL-UNNAMED",
              "--add-opens",
              "java.base/java.lang=ALL-UNNAMED",
              "-jar",
              vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
              "-configuration",
              jdtls_path .. "/" .. os_config,
              "-data",
              workspace,
            },
            root_dir = jdtls.setup.find_root({
              ".git",
              "mvnw",
              "gradlew",
              "pom.xml",
              "build.gradle",
              "build.gradle.kts",
            }),
            settings = {
              java = {
                eclipse = { downloadSources = true },
                maven = { downloadSources = true },
                implementationsCodeLens = { enabled = true },
                referencesCodeLens = { enabled = true },
                signatureHelp = { enabled = true },
                completion = {
                  favoriteStaticMembers = {
                    "org.junit.jupiter.api.Assertions.*",
                    "org.mockito.Mockito.*",
                  },
                },
              },
            },
            init_options = { bundles = bundles },
            on_attach = function(_, bufnr)
              jdtls.setup_dap({ hotcodereplace = "auto" })
              jdtls.setup.add_commands()
              local map = function(k, f)
                vim.keymap.set("n", k, f, { buffer = bufnr })
              end
              map("<leader>jo", jdtls.organize_imports)
              map("<leader>jv", jdtls.extract_variable)
              map("<leader>jm", jdtls.extract_method)
              map("<leader>jt", jdtls.test_nearest_method)
              map("<leader>jT", jdtls.test_class)
              map("<leader>jb", "<cmd>JdtUpdateDebugConfig<cr>")
            end,
          })
        end,
      })
    end,
  },
}
