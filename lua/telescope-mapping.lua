telescope.setup {
  defaults = {
    default_mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-i>"] = actions.goto_file_selection_split,
        ["<C-s>"] = actions.goto_file_selection_vsplit,
      },
    },
  }
}
