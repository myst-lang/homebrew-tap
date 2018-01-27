# Myst-lang Tap

A custom tap for installing versions of the [Myst programming language](https://github.com/myst-lang/myst).

## How do I install these formulae?
`brew install myst-lang/tap/<formula>`

Or `brew tap myst-lang/tap` and then `brew install <formula>`.

Or install via URL (which will not receive updates):

```
brew install https://raw.githubusercontent.com/myst-lang/homebrew-tap/master/Formula/<formula>.rb
```


## Preparing a new release

Brew doesn't do much for you for crafting a new release, so most of this is done manually. When a new release of Myst is ready to go out, these are the steps to updating this Tap to make the release available to users:

- Copy the current `myst-lang.rb` file into an archive file with the old version number (e.g. `myst-lang@0.3.0.rb`)
- Update the old formula class name to include the old version number (e.g. `class MystLangAT030 < Formula`)
- Create the tag on the main Myst repository (e.g. `git tag v0.4.0`)
- Get the archive URL from GitHub's releases page (e.g. "https://github.com/myst-lang/myst/archive/v0.4.0.tar.gz") and replace that in the formula file.
- Download a copy of the archive to a local `.tar.gz`.
- Run `shasum -a 256 /path/to/archive.tar.gz` to generate the shasum for the archive.
- Take the new shasum and replace it in the formula file.
- Commit and push to this repository.

After that, try running `brew upgrade myst-lang` and you should get the new version.
