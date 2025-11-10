#!/bin/bash
set -e

echo "Installing MCL setup"

cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d%H%M%S)
echo "Backup saved as ~/.zshrc.backup.<timestamp>"

cat << 'EOF' >> ~/.zshrc

#========== MCL Terminal Setup ==========

if [[ -f "$HOME/.deno/env" ]]; then
    . "$HOME/.deno/env"
fi

#customise terminal
alias customt='nano ~/.zshrc'

#customise terminal using vsc
alias customtc='code ~/.zshrc'

#source the .zshrc file
alias sourcezsh='source ~/.zshrc'

#npm install
alias npmi='npm install'

#brew install
alias brewi='brew install'

#clear shortcut
alias c='clear'

#deno run command
alias runD='deno run -A'

#python3 command
alias py3='python3'

#show your IP
alias myip='curl ifconfig.me'

#show your path
alias path='pwd'

#list current files
alias listF='ls'

#cd to the main directory
alias CDH='cd /Users/$(whoami)'

#brew doctor
alias bd='brew doctor'

#brew update
alias bu='brew update'

#short cuts array (used in the show cmd function)
short_cuts=(
	customt
	customtc
	sourcezsh
	npmi
	brewi
	c
	runD
	py3
	myip
	path
	MCL
	listF
	new 
	addCmd
	showCmd
	CDH
	bd
	bu
	checkAndKill
)

#short cuts array definitions (used in the show cmd function)
short_cuts_def=(
	"Open the ~/.zshrc file with nano"
	"open the ~/.zshrc file with VScode"
	"Reload the ~/.zshrc file"
	"The npm install line"
	"The brew install line"
	"clear"
	"The deno run -A command line"
	"Python3 command line"
	"Show your pc/computers ip"
	"Show current path"
	"Runs the main menu"
	"Use ls command line"
	"Make a new file/dir"
	"Shows all custom commands"
	"Add a new custom command from the terminal"
	"Cd to the main directory"
	"The brew doctor line"
	"The brew update line"
	"Check and or kill a port PID"
)

#checkAndKill function
function checkAndKill() {
	if [[ -z "$1" ]]; then
		echo "Usage: checkAndKill <port>"
		return 
	fi

	PORT=$1
	PID=$(lsof -ti:$PORT)

	if [[ -n "$PID" ]]; then 
		echo "Port $PORT is in use by PID $PID. Would you like to kill it? (y/n)"
		read -r confirm
		if [[ "$confirm" == "y" ]]; then
			kill -9 $PID
			echo "Port freed successfully."
		else
			echo "Port not killed."
		fi
	else 
		echo "Port $PORT is free. Nothing to kill."
	fi
}




#go to the main menu
function MCL() {
	echo "============ MCL =========="
	echo "##### terminal main menu #####"
	echo "***** Made by Martin Weiss *****"
	echo "%%%%% All rights reserved %%%%%"
	echo "##### $(date '+%Y-%m-%d %H:%M:%S') #####"

	#echo the system info
	echo "📊 System Info:"
	echo "User: $(whoami)"
	echo "Host: $(hostname)"
	echo "OS: $(sw_vers -productName) $(sw_vers -productVersion)"
	echo "Uptime: $(uptime | awk -F, '{print $1}')"
	echo "Disk Usage: $(df -h ~ | tail -1 | awk '{print $3 "/" $2}')"
	echo "Memory Usage: $(vm_stat | awk 'NR==1{print $3 " pages"}')"

	#echo commands
	echo "commands: "
	showCmd
	echo "you can use these commands to run in the terminal"
	echo "to get this page again just type MCL..."
	echo "=================================================="
}


#new function to make a new dir/file
function new() {
        running=true
        count=0

	#allow for 10 entries                        
        while [[ "$running" = true ]]; do
                echo "==================== NEW FILE FUNCTION ===================="
                echo "What do you want to make (file/directory/exit): "
                read -r type
                  
                if [[ "$type" == "exit" ]]; then
                        break

                elif [[ "$type" == "file" ]]; then
                        echo "======== Making file ========"
                        echo "File name: "
                        read -r name
                        touch "$name"
				
                elif [[ "$type" == "directory" || "$type" == "dir" ]]; then
                        echo "======== Making directory ========"
                        echo "Directory name: "
                        read -r name
                        mkdir -p "$name"
				
                else
                        echo "Invalid option. Please type 'file' or 'directory'"
                fi
                  
                ((count++))
                  
                if [[ $count -eq 10 ]]; then
                        echo "Reached maximum attempts. Exiting..."
                        running=false
                fi
        done
}

# the function to add a custom comand without having to open the zsh.
function addCmd() {
	echo "=================ADD CMD FUNCTION======================"
	echo "cmd definition: "
	read -r def
	echo "alias name: "
	read -r name
	echo "cmd to add: "
	read -r cmd
	
	echo "" >> ~/.zshrc
	echo "######## $cmd alias(addCmd) ########" >> ~/.zshrc
	echo "alias $name='$cmd'" >> ~/.zshrc
	short_cuts+=($cmd)
	short_cuts_def+=($def)
	sourcezsh
}

# the function to show all custom commands
function showCmd() {
	# loop through the short cuts array
	for i in {1..${#short_cuts[@]}}; do
		#echo the short cut at i and the matching definition
		echo "$i: ${short_cuts[$i]} — ${short_cuts_def[$i]}"
	done
}



#print the main menu
MCL

#================================= Modules =================================#
###############################################################################
#nvm/node module DO NOT TOUCH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

EOF

source ~/.zshrc

echo "MCL installation complete! Type 'MCL' to launch MCL main menu"