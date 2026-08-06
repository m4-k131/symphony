-- ================================================================================================
-- TITLE : ruff (Python Linter/Formatter LSP)
-- LINKS :
--   > github: https://github.com/astral-sh/ruff
-- ================================================================================================

--- @param capabilities table LSP client capabilities (from nvim-cmp)
--- @return nil
return function(capabilities)
  vim.lsp.config("ruff", {
    capabilities = capabilities,
    -- Let pyright handle hover/rename, ruff handles diagnostics + formatting
    on_attach = function(client, _)
      client.server_capabilities.hoverProvider = false
    end,
  })
end
