if status --is-login
  source "{{ shell__fish_login_script_path }}"
  source "$DOT_FISH_LOGIN_SCRIPT_PATH"
end

if status --is-interactive
  source "$DOT_FISH_INTERACTIVE_SCRIPT_PATH"
end
