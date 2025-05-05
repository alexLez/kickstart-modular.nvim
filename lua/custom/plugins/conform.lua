return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            python = { "ruff_organize_imports", "ruff_format" },
            markdown = { "mdformat" },
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 500,
        },
        formatters = {
            mdformat = {
                prepend_args = { "--wrap", "80" },
            },
        },
    },
}
