# DotFiles Repository


## Installation

[chezmoi](https://github.com/twpayne/chezmoi)


### Installation With Chezmoi

1. [Install chezmoi](https://www.chezmoi.io/install/):
   - Using `curl`:
     ```bash
     sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
     ```
   - Using `wget`:
     ```bash
     sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin
     ```
2. Apply:
   ```bash
   chezmoi init --apply https://github.com/aariam/dotfiles.git --source ~/dotfiles
   ```


### Installation From Local Clone

1. Clone this GitHub repository on your local machine.
2. Inside the repository, run the installation script:
   ```bash
   ./install.sh
   ```

The installation script first installs `chezmoi`
if not already installed, and uses it to install
all other applications and configuration files.



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
