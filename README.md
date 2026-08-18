# Orva Studio Homebrew tap

```bash
brew install --cask --no-quarantine Orva-Studio/tap/screenbox
```

`--no-quarantine` is needed because the apps here are ad-hoc signed rather than
notarised; without it macOS refuses to open them. See each cask's caveats.

## Casks

- [**screenbox**](Casks/screenbox.rb) — draw highlight boxes on screen while
  recording or presenting. ([source](https://github.com/Orva-Studio/screenbox))

The cask is updated automatically by the ScreenBox release workflow whenever a
new version is tagged.
