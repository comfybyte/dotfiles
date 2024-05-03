{
  programs.git = {
    enable = true;
    signing = {
      signByDefault = true;
      key = null;
    };
    extraConfig = {
      core.editor = "vim";
      init.defaultBranch = "main";
      push.default = "current";
      merge.conflictStyle = "diff3";
    };
  };
}
