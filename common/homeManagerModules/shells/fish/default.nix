{ pkgs, ... }: {
  home.packages = with pkgs.fishPlugins; [ fzf-fish forgit autopair puffer ];

  programs.fish = {
    enable = true;

    shellAbbrs = {
      nors = "doas nixos-rebuild switch --show-trace";

      txn = "tmux new";
      txl = "tmux list-sessions";
      txa = "tmux attach -t";

      ga = "git add";
      gs = "git status";
      gc = "git commit -m";

      v = "nvim .";
    };

    shellAliases = {
      ls = "eza";
      la = "eza -a";
      tree = "eza -T";
      cat = "bat";

      vim = "nvim";
      vi = "nvim";

      # edit nixconfig.
      en = "cd ~/nixcfg && $EDITOR .";
    };

    shellInit = ''
      set -g fish_greeting "<<< Welcome, $(whoami). >>>"

      direnv hook fish | source
    '';
  };

  home.file.".config/fish/themes/catppuccin_macchiato.theme".text =
    import ./catppuccin_macchiato.nix;
}
