{
  imports = [ ./cmp ./telescope ./fugitive ./markdown-preview ./oil ];

  programs.nixvim.plugins = {
    nix.enable = true;
    leap.enable = true;
    surround.enable = true;
    markdown-preview.enable = true;
    comment.enable = true;
    nvim-autopairs = {
      enable = true;
      disabledFiletypes = [ "clj" ];
    };
    ts-autotag.enable = true;
    trouble.enable = true;
  };
}
