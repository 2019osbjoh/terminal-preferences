# Insert the following lines into you ~/.bash_profile file
# Not the nicest scripting but works sufficeintly

# The basic aliases
# First alias in directory specific
#alias dev="cd ~/Documents/DEV/"
alias c="clear"
alias h="cd ~/"


bold=$(tput bold);
green=$(tput setaf 71);
white=$(tput setaf 15);
reset=$(tput sgr0);
red="$bold$(tput setaf 1)"
green=$(tput setaf 2)


check_status() {

boshka= git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' > /dev/null 2>&1

# Checks if something to commit or not
if git rev-parse --git-dir > /dev/null 2>&1; then
    if ! git status | grep "nothing to commit" > /dev/null 2>&1; then
      echo "${bold} x "
      return 0
    elif $boshka; then
        echo "${bold} ✓ "
    fi
fi
}

#PS1="\[\$(check_status)\]";
PS1="\[${bold}\]\h";
PS1+="\[${white}\][\w]";
PS1+="\[${reset}\]";
PS1+="\[\$(check_status)\]";
PS1+="\[${reset}\] ► ";

export PS1;
