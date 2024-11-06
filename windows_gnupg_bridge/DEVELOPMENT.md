# Development

## Move executable from Windows to Linux

The GnuPG Bridge executable is stored in Windows and called from Linux. This is
unnecessary. It can be stored in Linux and called without relying on any
WSL-specific features. Refactoring the role accordingly is a good idea.
