## dotfiles

This happens to be my flavor of dotfiles. I use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for my shell, but you can also bash. To install my dotfiles, clone this repo into ~.zshconfig/ and then add the following to your .zshrc:

```Shell
# load dotfiles
CONFIG=~/.zshconfig
for f in $(find $CONFIG -type f -name '*.zsh'); do source $f; done;
```

This will bootstrap in all my dotfiles. You can do something similar in your .bashrc or .profile if you're using bash.
