{
  programs.nixvim = let openOil = "<cmd>Oil --float<cr>";
  in {
    plugins.oil = {
      enable = true;
      settings = {
        keymaps = {
          "-" = openOil;
          "<c-b>" = openOil;

          "<c-h>" = false; # <c-v> instead of <c-h> for vsplit.
          "<c-v>" = "actions.select_vsplit";
        };
        view_options.show_hidden = true;
      };
    };

    keymaps = let helpers = import ../../helpers.nix;
    in [
      (helpers.mkN "<leader>pp" openOil)
      (helpers.mkNLua "<leader>px" ''
        function()
          vim.cmd("split")
          vim.cmd("Oil --float")
        end
      '')
      (helpers.mkNLua "<leader>pv" ''
        function()
          vim.cmd("vsplit")
          vim.cmd("Oil --float")
        end
      '')
    ];
  };
}
