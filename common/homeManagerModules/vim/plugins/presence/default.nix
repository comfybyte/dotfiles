{
  programs.nixvim.plugins.presence-nvim = {
    enable = true;
    enableLineNumber = false;
    editingText = "Editing %s";
    readingText = "Reading something";
    fileExplorerText = "In menu";
    workspaceText = "In workspace";
    mainImage = "file";
    neovimImageText = "Emacs";
    showTime = false;
  };
}
