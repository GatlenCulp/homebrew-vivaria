# GatlenCulp Vivarium
`https://github.com/GatlenCulp/vivaria/archive/refs/tags/v0.1.0.tar.gz`

`curl -L https://github.com/GatlenCulp/vivaria/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256`

= `eabcf6b3d0d63ba37cd6af03c0566e981d333b5a06fd38dd61102e9f72941ecd`

Uncertain why this is needed before installing:
`brew link docker`

`brew install --formula --debug --verbose ./Formula/vivaria.rb`

`brew uninstall --debug --verbose vivaria`

`brew cleanup`

`gem install ruby-lsp`
`gem install debug`

https://rubydoc.brew.sh/Formula#homepage%3D-class_method

TODO: Use for language specific dependencies (resources):
https://rubydoc.brew.sh/Formula#resource-class_method
Ex: https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/j/jrnl.rb

TODO: Add man pages to `prefix/share/man`
TODO: Add docs to `prefix/share/doc/<name>`

TODO: Make a `.gitattributes` file to exclude files from releases for install.

TODO: `brew audit --strict --online` to check whether this fits the brew style guide.

I really should have just read the docs.

## How do I install these formulae?

`brew tap gatlenculp/vivaria` and then `brew install vivaria`.

<!-- Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`: -->

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Project notes

I am creating a brew formula for [Vivaria](https://vivaria.metr.org/), Vivaria is METR's tool for running evaluations and conducting agent elicitation research. Vivaria is a web application with which users can interact using a web UI and a command-line interface.

I have created my own fork to install and test from located at [https://github.com/GatlenCulp/vivaria/](https://github.com/GatlenCulp/vivaria/)
