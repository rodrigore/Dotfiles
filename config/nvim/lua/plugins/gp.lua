return {
  "robitx/gp.nvim",
  lazy = false,
  config = function()
    require("gp").setup({
      agents = {
        {
          name = "Codellama",
          chat = true,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "codellama", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "You are a general AI assistant.\n\n"
            .. "The user provided the additional info about how they would like you to respond:\n\n"
            .. "- If you're unsure don't guess and say you don't know instead.\n"
            .. "- Ask question if you need clarification to provide better answer.\n"
            .. "- Think deeply and carefully from first principles step by step.\n"
            .. "- Zoom out first to see the big picture and then zoom in to details.\n"
            .. "- Use Socratic method to improve your thinking and coding skills.\n"
            .. "- Don't elide any code from your output if the answer requires coding.\n"
            .. "- Take a deep breath; You've got this!\n",
        },
        {
          name = "ChatGPT4",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "You are a general AI assistant.\n\n"
            .. "The user provided the additional info about how they would like you to respond:\n\n"
            .. "- If you're unsure don't guess and say you don't know instead.\n"
            .. "- Ask question if you need clarification to provide better answer.\n"
            .. "- Think deeply and carefully from first principles step by step.\n"
            .. "- Zoom out first to see the big picture and then zoom in to details.\n"
            .. "- Use Socratic method to improve your thinking and coding skills.\n"
            .. "- Don't elide any code from your output if the answer requires coding.\n"
            .. "- Take a deep breath; You've got this!\n",
        },
        {
          name = "ChatGPT3-5",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-3.5-turbo-1106", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "You are a general AI assistant.\n\n"
            .. "The user provided the additional info about how they would like you to respond:\n\n"
            .. "- If you're unsure don't guess and say you don't know instead.\n"
            .. "- Ask question if you need clarification to provide better answer.\n"
            .. "- Think deeply and carefully from first principles step by step.\n"
            .. "- Zoom out first to see the big picture and then zoom in to details.\n"
            .. "- Use Socratic method to improve your thinking and coding skills.\n"
            .. "- Don't elide any code from your output if the answer requires coding.\n"
            .. "- Take a deep breath; You've got this!\n",
        },
        {
          name = "CodeGPT4",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4-1106-preview", temperature = 0.8, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "You are an AI working as a code editor.\n\n"
            .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
            .. "START AND END YOUR ANSWER WITH:\n\n```",
        },
        {
          name = "CodeGPT3-5",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-3.5-turbo-1106", temperature = 0.8, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "You are an AI working as a code editor.\n\n"
            .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
            .. "START AND END YOUR ANSWER WITH:\n\n```",
        },
      },
      hooks = {
        -- example of usig enew as a function specifying type for the new buffer
        CodeReview = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please analyze for code smells and suggest improvements."
          local agent = gp.get_chat_agent()
          gp.Prompt(params, gp.Target.enew("markdown"), nil, agent.model, template, agent.system_prompt)
        end,
        -- example of making :%GpChatNew a dedicated command which
        -- opens new chat with the entire current buffer as a context
        BufferChatNew = function(gp, _)
          -- call GpChatNew command in range mode on whole buffer
          vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
        end,
      },
    })
  end,
  -- keys = function()
  --   return {
  --     {
  --       mode = { "i" },
  --       { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew", nowait = true, remap = false },
  --       { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit", nowait = true, remap = false },
  --       { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split", nowait = true, remap = false },
  --       { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)", nowait = true, remap = false },
  --       { "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)", nowait = true, remap = false },
  --       { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat", nowait = true, remap = false },
  --       { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder", nowait = true, remap = false },
  --       { "<C-g>g", group = "generate into new ..", nowait = true, remap = false },
  --       { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew", nowait = true, remap = false },
  --       { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew", nowait = true, remap = false },
  --       { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup", nowait = true, remap = false },
  --       { "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew", nowait = true, remap = false },
  --       { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew", nowait = true, remap = false },
  --       { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent", nowait = true, remap = false },
  --       { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite", nowait = true, remap = false },
  --       { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop", nowait = true, remap = false },
  --       { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat", nowait = true, remap = false },
  --       { "<C-g>w", group = "Whisper", nowait = true, remap = false },
  --       { "<C-g>wa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)", nowait = true, remap = false },
  --       { "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)", nowait = true, remap = false },
  --       { "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew", nowait = true, remap = false },
  --       { "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New", nowait = true, remap = false },
  --       { "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup", nowait = true, remap = false },
  --       { "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite", nowait = true, remap = false },
  --       { "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew", nowait = true, remap = false },
  --       { "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew", nowait = true, remap = false },
  --       { "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper", nowait = true, remap = false },
  --       { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext", nowait = true, remap = false },
  --     },
  --   }
  --
  -- end,
}
