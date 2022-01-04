return {
  logging = false,
  filetype = {
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    go = {
	-- gofmt
      function()
        return {
          exe = "gofmt",
          stdin = true
        }
      end
    },
    lua = {
        -- luafmt
        function()
          return {
            exe = "lua-format",
            args = {"--indent-width", 4},
            stdin = true
          }
        end
      },
  },
}

