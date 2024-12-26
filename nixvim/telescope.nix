{
  plugins.web-devicons.enable = true;

  plugins.telescope = {
    enable = true;

    extensions.file-browser = {
      enable = true;
    };

    keymaps = {
      "<leader>." = {
        action = "find_files";
        options.desc = "Find file";
      };
      "<leader>," = {
        action = "buffers";
        options.desc = "Find buffer";
      };
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Search text";
      };
    };
  };

  keymaps = [
    {
      key = "<leader>d";
      action = "<cmd>Telescope file_browser<cr>";
      options.desc = "File browser";
    }
  ];
}
