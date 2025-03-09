return {
  "frankroeder/parrot.nvim",
  dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
  enabled = false, -- load on an as-needed basis
  -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require("parrot").setup {
      -- Providers must be explicitly added to make them available.
      providers = {
        anthropic = {
          api_key = os.getenv "ANTHROPIC_API_KEY",
        },
        gemini = {
          api_key = os.getenv "GEMINI_API_KEY",
        },
        groq = {
          api_key = os.getenv "GROQ_API_KEY",
        },
        mistral = {
          api_key = os.getenv "MISTRAL_API_KEY",
        },
        pplx = {
          api_key = os.getenv "PERPLEXITY_API_KEY",
        },
        -- provide an empty list to make provider available (no API key required)
        ollama = {},
        openai = {
          api_key = os.getenv "OPENAI_API_KEY",
        },
        github = {
          api_key = os.getenv "GITHUB_TOKEN",
        },
        nvidia = {
          api_key = os.getenv "NVIDIA_API_KEY",
        },
        xai = {
          api_key = os.getenv "XAI_API_KEY",
        },
      },
    }
  end,
}
