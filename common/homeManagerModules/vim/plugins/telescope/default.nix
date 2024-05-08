{ lib, ... }: {
  programs.nixvim = let enableBrowser = true;
  in {
    globals = lib.mkIf enableBrowser {
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };
    keymaps = let
      helpers = import ../../helpers.nix;
      telescope = fn: ''require("telescope.builtin").${fn}'';
      showBowser = ''
        require("telescope").extensions.file_browser.file_browser({ path = "%:p:h"})'';
      luaFn = body: "function() ${body} end";
      inherit (helpers) mkNLua;
    in [
      (mkNLua "<leader>ff" (telescope "find_files"))
      (mkNLua "<leader>fg" (telescope "live_grep"))
      (mkNLua "<leader>fb" (telescope "buffers"))
      (mkNLua "<leader>fd" (telescope "diagnostics"))
      (mkNLua "<leader>fq" (telescope "quickfix"))
      (mkNLua "<leader>fo" (telescope "vim_options"))
      (mkNLua "<leader>fc" (telescope "command_history"))
      (mkNLua "<leader>fm" (telescope "marks"))
      (mkNLua "<leader>fr" (telescope "lsp_references"))
      (mkNLua "<leader>fi" (telescope "lsp_implementations"))
      (mkNLua "<leader>o" (telescope "oldfiles"))
    ] ++ lib.optionals enableBrowser [
      (mkNLua "<leader>pp" (luaFn showBowser))
      (mkNLua "<leader>pv" (luaFn ''
        vim.cmd("vsplit")
        ${showBowser}
      ''))
      (mkNLua "<leader>px" (luaFn ''
        vim.cmd("split")
        ${showBowser}
      ''))
    ];
    plugins.telescope = {
      enable = true;
      extensions = {
        # Enable Telescope's File Browser.
        file_browser = lib.mkIf enableBrowser {
          enable = true;
          hijackNetrw = true;
          # Shows all files, even .gitignore'd ones.
          respectGitignore = false;
        };
        fzf-native.enable = true;
      };
    };
  };
}
