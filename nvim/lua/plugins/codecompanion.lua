return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  lazy = false,
  config = function()
    require("telescope")

    require("codecompanion").setup({
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-2.5-pro",
              },
            },
            env = {
              api_key = os.getenv("GEMINI_API_KEY"),
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "gemini",
          slash_commands = {
            buffer = {
              callback = "strategies.chat.slash_commands.buffer",
              opts = {
                contains_code = true,
                provider = "telescope"
              }
            },
            file = {
              callback = "strategies.chat.slash_commands.file",
              opts = {
                contains_code = true,
                max_lines = 1000,
                provider = "telescope"
              }
            },
            files = {
              callback = "strategies.chat.slash_commands.files",
              opts = {
                contains_code = true,
                max_lines = 1000,
                provider = "telescope"
              }
            }
          }
        },
        inline = {
          adapter = "gemini"
        },
        agent = {
          adapter = "gemini"
        }
      }
    })
  end
}
