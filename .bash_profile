# https://github.com/stackkteam/gargula/blob/master/ps1.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

export JAVA_HOME=$(/usr/libexec/java_home)

export PATH="$HOME/.cargo/bin:$PATH"

##
# Your previous /Users/John_Osborne/.bash_profile file was backed up as /Users/John_Osborne/.bash_profile.macports-saved_2019-10-04_at_22:52:22
##

# MacPorts Installer addition on 2019-10-04_at_22:52:22: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

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
