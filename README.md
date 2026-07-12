# pfedotovsky's Homebrew tap

## Agents Hub

Desktop app for controlling coding agents on remote CloudCLI hosts.

```sh
brew install --no-quarantine pfedotovsky/tap/agents-hub
```

> The `--no-quarantine` flag is needed while the app ships unsigned —
> without it Gatekeeper reports the app as damaged. Once releases are
> signed and notarized, plain `brew install pfedotovsky/tap/agents-hub`
> will work.

### Updating the cask after a new release

1. Download the new `Agents.Hub_<version>_universal.dmg` from the
   [releases page](https://github.com/pfedotovsky/agents-fleet-hub/releases)
2. `shasum -a 256 <dmg>`
3. Bump `version` and `sha256` in `Casks/agents-hub.rb`
