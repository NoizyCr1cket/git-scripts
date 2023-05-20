# git-scripts

## Installation

Add aliases to the scripts under `custom-commands` by listing them under your `[alias]` section of your `.gitconfig`. Examples are below, but you may need to modify the paths for your environment.

Mac/Linux:

```sh
chmod 755 custom-commands/git-catchup
git config --global alias.catchup !'~/src/git-scripts/custom-commands/git-catchup'
```

Windows:

```bat
git config --global alias.catchup !'%userprofile%\src\git-scripts\custom-commands\git-catchup.bat'
```
