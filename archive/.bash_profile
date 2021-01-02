# https://superuser.com/questions/544989/does-tmux-sort-the-path-variable
if [ -f /etc/profile ]; then
    PATH="/usr/bin:/bin"
    source /etc/profile
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
