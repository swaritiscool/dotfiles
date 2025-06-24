local jdtls = require("jdtls")
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == nil then
  return
end

local home = vim.env.HOME
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

jdtls.start_or_attach({
  cmd = { "jdtls" },
  root_dir = root_dir,
  workspace_folder = workspace_dir,
  settings = {
    java = {},
  },
})
