{
  plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<leader>t]]";
      insert_mappings = false;
      direction = "float";
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed = "<leader>t";
      group = "Terminal";
    }
  ];
}
