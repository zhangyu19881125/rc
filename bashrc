alias l='ls -ltrh '
alias ..='cd ../; ls -ltrh '
alias h='cd /Users/yuzhang/Code/ '
alias sc='cd /Users/yuzhang/Code/user_transaction_list/; ls -ltrh '
function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
       echo " ($branch)"
   fi
}
export PS1='\n\[\033[01;36m\]\w\[\033[01;32m\]$(git_branch)\[\033[00m\] \n[\t] \[\033[01;33m\]macbook \[\033[00m\]-> '
alias alt='source /apsara/workspace/cunchu.zy/alt.sh'

function tmux-help {
    echo "tmux new -s <session-name>"
    echo "tmux attach -t <session-name>"
    echo "tmux detach"
    echo "tmux ls"
    echo "tmux new-window"
    echo "tmux next-window"
    echo "tmux previous-window"
    echo "tmux list-commands"
    echo "tmux show-options -g | grep prefix"
}
function tmux-new-or-attach {
    if $(tmux ls | egrep -q "Macbook")
    then
        TERM=xterm-256color tmux attach -t Macbook
    else
        TERM=xterm-256color tmux new -s Macbook
    fi
}
alias ss='tmux-new-or-attach'

alias vim='touch .session.vim.swp; /usr/local/bin/vim -S .session.vim.swp '
alias ctags='/usr/local/bin/ctags -R .'
