/usr/bin/find . -name "*.txt"
/usr/bin/find ~/dotfiles -name "rc.lua"

/usr/bin/find ~/dotfiles -type d -name "*some"
/usr/bin/find ~/dotfiles -type d -name "*so??"
/usr/bin/find ~/dotfiles -type f -name "*rc??"

# not
/usr/bin/find ~/dotfiles -type d ! -name "*some"

# case insencitive
/usr/bin/find ~/dotfiles -type d -iname "*some"