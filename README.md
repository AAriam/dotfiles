# DotFiles Repository

A [dotfiles repository](https://dotfiles.github.io/)
is a collection of configuration files and scripts 
to set up and customize a machine.
It can also be used with [VS Code](https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories)
and [GitHub Codespaces](https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles)
to personalize devcontainers.

This dotfiles repository uses [chezmoi](https://github.com/twpayne/chezmoi)
to manage configuration files in the system's home directory
and run scripts that install applications and packages.


## Installation

### VS Code

To apply this dotfiles repository 
to every devcontainer created by your VS Code,
add the following configurations to your VS Code `settings.json` file 
(cf. [docs](https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories)):

```json
{
  "dotfiles.repository": "aariam/dotfiles",
  "dotfiles.installCommand": "install.sh",
  "dotfiles.targetPath": "~/dotfiles",
}
```

> [!NOTE]
> These configurations are already added to the `settings.json` file 
> that is part of this dotfiles repository.
> Therefore, if you directly install this repository in your local machine,
> all VS Code devcontainers you create afterwards 
> will automatically install this repository as well.


### GitHub Codespaces

To apply this dotfiles repository
to every codespace created by your GitHub account,
go to [Settings > Codespaces](https://github.com/settings/codespaces) in your GitHub account,
enable **Automatically install dotfiles** under the **Dotfiles** section,
and select this repository from the dropdown menu 
(cf. [docs](https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles)).
Note that you can only select from repositories you own,
so you must first recreate this repository in your GitHub account.


### Local Machine

To apply this dotfile repository
to your local machine,
there are two options:

- Use `chezmoi` to download and install the repository.
- Manually download the repository and run its installation script.


#### Chezmoi

1. [Install chezmoi](https://www.chezmoi.io/install/) if not already available:
   - Using `curl`:
     ```bash
     sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
     ```
   - Using `wget`:
     ```bash
     sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin
     ```
2. Download and apply the repository using the [`chezmoi init`](https://www.chezmoi.io/reference/commands/init/) command
   (see [Global command line flags](https://www.chezmoi.io/reference/command-line-flags/global/) for more options):
   ```bash
   chezmoi init --apply aariam/dotfiles
   ```


#### Manual

1. Clone this GitHub repository on your local machine.
   For example, using `git`:
   ```bash
   git clone https://github.com/aariam/dotfiles.git
   ```
2. Run the installation script inside the repository directory:
   ```bash
   sh ./dotfiles/install.sh
   ```

> [!NOTE]
> The installation script first installs `chezmoi`
> if not already installed, and uses it to install
> all other applications and configuration files.


## Contents


### Packages

Applications and packages are installed
via the script at `home/.chezmoiscripts/run_onchange_before__install-packages.sh.tmpl`.


#### macOS

Applications and packages are defined at `home/.chezmoidata/brewfile.yaml`
in a [Brewfile](https://docs.brew.sh/Brew-Bundle-and-Brewfile) format.
The actual `Brewfile` is generated in the installation script,
which uses [`brew bundle`](https://docs.brew.sh/Manpage#bundle-subcommand)
to install them.


### Configuration Files

#### Zsh

[Zsh](https://www.zsh.org/)



## External Settings


### Visual Studio Code

User, workspace, and profile [settings](https://code.visualstudio.com/docs/configure/settings)
can be configured in the [`settings.json` file](https://code.visualstudio.com/docs/configure/settings#_settings-json-file)
or using the [Settings editor](https://code.visualstudio.com/docs/configure/settings#_settings-editor).


#### Settings Sync

Turn on [Settings Sync](https://code.visualstudio.com/docs/configure/settings-sync)
and sign in with your GitHub account
to automatically sync settings, extensions, 
and keyboard shortcuts across devices.


## Resources

- [Dotfiles: your unofficial guide to dotfiles on GitHub](https://dotfiles.github.io/)
- [Awesome Dotfiles: a curated list of dotfiles resources](https://github.com/webpro/awesome-dotfiles)
- [chezmoi-based dotfile repositories](https://www.chezmoi.io/links/dotfile-repos/)


## Examples

- [Tom Payne's dotfiles](https://github.com/twpayne/dotfiles/) (creator of chezmoi)
- [Mathias Bynens's dotfiles](https://github.com/mathiasbynens/dotfiles/tree/master) (including a popular [.macos](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) configuration file)
- [Anish Athalye's dotfiles](https://github.com/anishathalye/dotfiles) (creator of [dotbot](https://github.com/anishathalye/dotbot))
- [sobolevn's dotfiles](https://github.com/sobolevn/dotfiles)
