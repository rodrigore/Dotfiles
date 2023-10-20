vim.g.copilot_node_command = "/opt/homebrew/bin/node"
return {
  "github/copilot.vim",
  enabled = false,
  cmd = "Copilot",
  build = ":Copilot setup",
}
