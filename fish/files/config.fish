if status --is-login
  source ~/.config/shell/login.fish
  source $DOT_FISH_LOGIN
end

if status --is-interactive
  source $DOT_FISH_INTERACTIVE
end
