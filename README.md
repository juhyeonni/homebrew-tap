# homebrew-tap

Homebrew casks for juhyeonni's apps.

```sh
brew tap juhyeonni/tap
brew install --cask tabieum
```

## Releasing a new version

After the GitHub release `v<version>` has `tabieum-<version>.zip`:

```sh
scripts/bump.sh <version>   # downloads the zip, writes version and sha256 into Casks/tabieum.rb
```

Then commit and push. `brew upgrade --cask tabieum` picks it up.
