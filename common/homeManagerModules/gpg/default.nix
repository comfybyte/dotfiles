{
  # Corrige o `vim-fugitive` crashando na hora de dar commit.
  home.sessionVariables.GPG_TTY = "$(tty)";
  home.file.".gnupg/gpg.conf".text = ''
    use-agent
    pinentry-mode loopback
  '';
}
