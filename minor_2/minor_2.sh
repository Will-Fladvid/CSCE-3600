#!/bin/bash
#William Fladvid WJF0053

#debug mode
if [[ "$1" == "--debug" ]]; then
	set -x
	echo "[DEBUG] Verbose mode enabled."

fi

LOG_FILE="activity.log"
reminders=()
max_reminders=5

#creates the log file for each action
log_action() {
	echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

#stops user from exiting other than entering 6
trap 'echo -e "\nWARNING! Use the menu to exit safely."; log_action "Interrupted by signal"' SIGINT SIGTERM


echo "Hello, $(whoami)!"

echo "Date and Time: $(date)"

echo "Calendar:"
cal

echo "Running Processes: $(ps -e --no-headers | wc -l)"


while(( selection != 6 )); do
read -p "Choose an option: 
	1) Organize Files
	2) Add Reminder
	3) View Reminders
	4) Delete Reminder
	5) Health Check
	6) Exit

	Selection: " selection
	

	case "$selection" in

		"1")
			read -p "What directory would you like to organize? " directory

			if [[ -d $directory ]]; then 
				echo "searching $dir"
				
				total_files=$(find "$directory" -maxdepth 1 -type f | wc -l)
				echo "Total Files: "$total_files

				echo "Text files:"
				find "$directory" -maxdepth 1 -name "*.txt"
				echo "Log Files:"
				find "$directory" -maxdepth 1 -name "*.log"
				echo "Shell scripts"
				find "$directory" -maxdepth 1 -name "*.sh"
				
				if ls "$directory"/*.log >/dev/null 2>&1; then
				
					mkdir -p "$dir/logs"
					mv "$dir"/*log "$dir/logs"
					echo "Log file moved to $dir/logs/"
	 				log_aciton "Moved .log file $dir"
				fi
			else
				echo "Invalid directory."
			fi
			;;


		"2")	#adds a reminder if the reminder list is not = 5
			if [ ${#reminders[@]} -lt $max_reminders ]; then
				read -p "Enter reminder: " new_rem
				reminders+=("$new_rem")
				log_action "Added reminder: $new_rem"
			else
				echo "Reminder list is full!"
			fi
			;;
		"3")
			echo "Reminders:"
			for i in "${!reminders[@]}"; do
				echo "$i: ${reminders[$i]}"
			done
			log_action "Viewed reminders"

			;;
		"4")	
			read -p "Enter index to delete: " index
			if [[ -n "${reminders[$index]}" ]]; then
				log_action "Deleted reminder: {$reminders[$index]}"
				unset 'reminders[$index]' #deletes the reminder

				reminders=("${reminders[@]}")
				echo "Deleted."
			else
				echo "Invalid index."
			fi
			;;
		"5")	
			read -p "Enter your heart rate: " rate
			if [[ "$rate" -le 59 ]]; then
				echo "Heart Rate is low"
			
			elif [ "$rate" -lt 100 ]; then
                                echo "Heart Rate is normal."

			else
                                echo "Heart Rate is high."
			fi
			log_action "Health check performed: $rate BPM"
			;;

		"6")	echo "see ya!"
			log_action "User exited script"
			exit 0
			;;
		*)
			echo "INVALID: Please make a selection between 1-6 "
			;;

	esac
done
