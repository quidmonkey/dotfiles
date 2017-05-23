## dotfiles

This happens to be my flavor of dotfiles. I use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for my shell, but you can also bash. To install my dotfiles, clone this repo into `~/.dotfiles/` and then add the following to your .zshrc:

```Shell
# load dotfiles
for f in ~/.dotfiles/*.zsh; do source $f; done
```

This will load all my dotfiles. You can do something similar in your .bashrc or .profile if you're using bash.

I sync my dotfiles between OSX and Ubuntu, thus I have system-specific configs in the osx.zsh and ubuntu.zsh files respectively.
