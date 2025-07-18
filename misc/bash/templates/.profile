#region source_dyn_shell
source "{{ shell__bash_login_script_path }}"
#endregion

#region source_dyn_default
source "$DOT_BASH_PROFILE_SCRIPT_PATH"
#endregion

#region source_default
source "$HOME/.bashrc"
#endregion
