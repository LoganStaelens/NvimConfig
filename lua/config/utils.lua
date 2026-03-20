
function get_git_root()
  local file_dir = vim.fn.expand("%:p:h") -- directory of current file

  local git_root = vim.fn.systemlist({
    "git",
    "-C",
    file_dir,
    "rev-parse",
    "--show-toplevel",
  })[1]
  if vim.v.shell_error ~= 0 then
    return nil
  end
  return git_root
end


