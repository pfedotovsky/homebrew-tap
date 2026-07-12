# pfedotovsky's Homebrew tap

## Agents Hub

Desktop app for controlling coding agents on remote CloudCLI hosts.

```sh
brew install --cask pfedotovsky/tap/agents-hub
```

> Releases are not notarized yet. If macOS refuses to open the app,
> clear the quarantine flag:
> `xattr -dr com.apple.quarantine "/Applications/Agents Hub.app"`
> (or set `HOMEBREW_CASK_OPTS=--no-quarantine` before installing).
> This will no longer be needed once releases are signed and notarized.

### Updating the cask after a new release

1. Download the new `Agents.Hub_<version>_universal.dmg` from the
   [releases page](https://github.com/pfedotovsky/agents-fleet-hub/releases)
2. `shasum -a 256 <dmg>`
3. Bump `version` and `sha256` in `Casks/agents-hub.rb`
