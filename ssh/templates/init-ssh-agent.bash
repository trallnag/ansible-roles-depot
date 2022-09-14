source "{{ ssh_data_dir }}/agent.bash" &> /dev/null
if ! ([[ -v SSH_AGENT_PID ]] && [[ -v SSH_AUTH_SOCK ]] && ps -q "$SSH_AGENT_PID" | grep "ssh-agent$" &> /dev/null); then
  rm -f "{{ ssh_data_dir }}/agent" &> /dev/null
  eval $(ssh-agent -a "{{ ssh_data_dir }}/agent") &> /dev/null
  echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK; export SSH_AGENT_PID=$SSH_AGENT_PID" > "{{ ssh_data_dir }}/agent.zsh"
  echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK; export SSH_AGENT_PID=$SSH_AGENT_PID" > "{{ ssh_data_dir }}/agent.bash"
  echo "set -x SSH_AUTH_SOCK $SSH_AUTH_SOCK; set -x SSH_AGENT_PID $SSH_AGENT_PID" > "{{ ssh_data_dir }}/agent.fish"
fi
