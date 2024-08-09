# Ansible Role `direnv`

Installs and configures [direnv](https://github.com/direnv/direnv).

Note that the role does set up the integration with zsh. This is done directly
in the zsh role due to the special requirements of powerlevel10k. For more
information, see:

- <https://github.com/romkatv/powerlevel10k#how-do-i-initialize-direnv-when-using-instant-prompt>
- <https://github.com/romkatv/powerlevel10k/issues/702>
