{
  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 3000;
      format = builtins.concatStringsSep "" [
        "$username"
        "$hostname"
        "$directory"
        "$nix_shell"
        "$rust"
        "$gleam"
        "$erlang"
        "$lua"
        "$fennel"
        "$deno"
        "$nodejs"
        "$git_branch"
        "$cmd_duration"
        "$character"
        "$linebreak"
      ];
      add_newline = true;
      username = {
        show_always = true;
        format = "\\[[$user]($style)@";
        style_user = "bold cyan";
        style_root = "bold bright-red";
      };
      hostname = {
        ssh_only = false;
        style = "bold bright-purple";
        format = "[$hostname]($style)\\]";
      };
      directory = {
        format = " in <[$path]($style)[$read_only]($read_only_style)> ";
        read_only = " <no touchie!>>";
        truncation_length = 2;
      };
      nix_shell = { format = " [$state( ($name))]($style)"; };
    };
  };
}
