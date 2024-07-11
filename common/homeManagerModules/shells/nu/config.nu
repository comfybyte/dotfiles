alias nors = doas nixos-rebuild switch --show-trace
alias txn = tmux new
alias txl = tmux list-sessions
alias txa = tmux attach -t
alias ga = git add
alias gs = git status
alias gc = git commit -m
alias v = nvim .

def lsdir [path?: directory] {
  if ($path == null) {
    ls | where type == "dir"
  } else {
    ls $path | where type == "dir"
  }
}
