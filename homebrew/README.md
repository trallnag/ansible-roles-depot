# Ansible Role `homebrew`

This role installs Homebrew and several formulaes.

- <https://docs.brew.sh/Homebrew-on-Linux>

## Included Formulae

- [`gh`: GitHub’s official command line tool](https://github.com/cli/cli)
- [`hugo`: Framework for building websites](https://github.com/gohugoio/hugo)
- [`zellij`: Terminal workspace with batteries](https://github.com/zellij-org/zellij)

## Version Management

Version of Homebrew is not managed via Ansible. Can be done like this:

    brew update

Versions and updates of installed formulaes are not managed via Ansible. Can be
done like this:

    brew upgrade
