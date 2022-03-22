alias cls="clear"
alias dir="ls"
alias lss="ls -a"
ggrep() {
    # a nice grep command
    grep -inr --color "$1" "$2"
}
