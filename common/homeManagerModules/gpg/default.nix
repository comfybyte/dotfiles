{
  home.sessionVariables.GPG_TTY = "$(tty)";
  home.file.".gnupg/gpg.conf".text = ''
    use-agent
    pinentry-mode loopback
  '';
}
