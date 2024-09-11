# GatlenCulp Vivarium
https://github.com/GatlenCulp/vivaria/archive/refs/tags/v0.1.0.tar.gz
curl -L https://github.com/GatlenCulp/vivaria/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
eabcf6b3d0d63ba37cd6af03c0566e981d333b5a06fd38dd61102e9f72941ecd

brew install --formula --debug --verbose ./Formula/vivaria.rb

gem install ruby-lsp
gem install debug

TODO: Make a .gitattributes file to exclude files from releases for install.

## How do I install these formulae?

`brew install gatlenculp/vivarium/<formula>`

Or `brew tap gatlenculp/vivarium` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "gatlenculp/vivarium"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
