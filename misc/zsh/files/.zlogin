#region compile_stuff
{
  sleep 3

  nice -n 19 "$DOT_ZSH_SCRIPTS_DIR_PATH/zcompile-zcompdump.zsh" > /dev/null 2>&1

  sleep 1

  nice -n 19 "$DOT_ZSH_SCRIPTS_DIR_PATH/zcompile-stuff.zsh" > /dev/null 2>&1
} &!
#endregion

#region source_dyn_default
source "$DOT_ZSH_ZLOGIN_SCRIPT_PATH"
#endregion
