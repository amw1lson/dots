return {
  cmd = { "clangd", "--background-index", "clang-tidy", "--completion-style=detailed", "--header-insertion=iwyu" }, -- or just { "clangd" } if on PATH
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".git",
    "compile_commands.json",
    "compile_flags.txt",
  },
}
