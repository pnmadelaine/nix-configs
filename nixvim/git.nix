let
  cmd = mode: key: cmd: desc: {
    key = "<leader>${key}";
    action = "<cmd>Gitsigns ${cmd}<cr>";
    options = { inherit desc; };
  };
in
{
  plugins.lazygit.enable = true;

  plugins.gitsigns = {
    enable = true;
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed = "<leader>v";
      group = "Git";
    }
    {
      __unkeyed = "<leader>vs";
      group = "Staging";
    }
    {
      __unkeyed = "<leader>vt";
      group = "Toggles";
    }
    {
      __unkeyed = "<leader>vd";
      group = "Diff";
    }
  ];

  keymaps = [
    # Navigation
    (cmd "n" "vp" "prev_hunk" "Previous hunk")
    (cmd "n" "vn" "next_hunk" "Next hunk")

    # Staging
    (cmd "n" "vss" "stage_hunk" "Stage hunk")
    (cmd "n" "vsr" "reset_hunk" "Reset hunk")
    (cmd "n" "vsS" "stage_buffer" "Stage buffer")
    (cmd "n" "vsu" "undo_stage_hunk" "Undo stage hunk")
    (cmd "n" "vsR" "reset_buffer" "Reset buffer")

    # Toggles
    (cmd "n" "vtb" "toggle_current_line_blame" "Current line blame")
    (cmd "n" "vtd" "toggle_deleted" "Deleted")
    (cmd "n" "vts" "toggle_signs" "Signs")
    (cmd "n" "vtn" "toggle_numhl" "Number highlight")
    (cmd "n" "vtl" "toggle_linehl" "Line highlight")
    (cmd "n" "vtw" "toggle_word_diff" "Word diff")

    # Diff
    (cmd "n" "vdh" "diffthis" "With HEAD")
    (cmd "n" "vP" "preview_hunk" "Preview Hunk")
  ];

}
