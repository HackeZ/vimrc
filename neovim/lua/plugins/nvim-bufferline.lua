return {
  options = {
    show_buffer_icons = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    diagnostics = "nvim_lsp",
    -- diagnostics_indicator = function(count, level) return '(' .. count .. ')' end,
    --[[ diagnostics_indicator = function(count, level)
      local icon = level:match("error") and "" or level:match('warning') and "" or ''
      return " " .. icon .. count
    end, ]]
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and "" or
                        (e == "warning" and "" or "")
        s = s .. sym .. n
      end
      return s
    end,
    -- offsets = {{filetype = "NvimTree", text = "NvimTree"}}
  }
}
