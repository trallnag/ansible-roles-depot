# Ansible Role `homebrew`

This role installs Homebrew and several formulaes.

- <https://docs.brew.sh/Homebrew-on-Linux>

## Unlinked Formulae

Why do I install some formulae but keep them unlinked? Unlinked formulae satisfy
formulae dependencies while allowing me to maintain such dependencies outside of
Homebrew. This comes in handy whenever I need multiple versions of the same
package. A scenario not well supported by Homebrew.

Here is an example: The `kubectx` formula depends on kubectl within the
`kubernetes-cli` formula. I can't use `kubernetes-cli` because I need multiple
versions of kubectl at the same time. I need to manage the installations myself.
Therefore I unlink `kubernetes-cli`.

## Version Management

Version of Homebrew is not managed via Ansible. Can be done like this:

    brew update

Versions and updates of installed formulaes are not managed via Ansible. Can be
done like this:

    brew upgrade

Also execute the following script to relink formula. Why? For example if
`kubernetes-cli` is unlinked and `brew upgrade` upgrades `kubernetes-cli`,
`kubernetes-cli` will now be linked again.

    brew-unlink
