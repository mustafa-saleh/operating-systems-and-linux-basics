#!/bin/bash

current_user=$(whoami)

echo "current user is: $current_user"

read -p "would you like to sort the processes by cpu or memory usage? (c/m): " sort_choice
read -p "how many processes would you like to display? (default is 10): " process_count

echo 
echo "Top $process_count processes for user $current_user sorted by $sort_choice usage:"
echo "------------------------------------------------------------"

if [ "$sort_choice" == "c" ]
then
    ps aux --sort -%cpu | grep -i $current_user | head -n "$process_count"
elif [ "$sort_choice" == "m" ]
then
    ps aux --sort -%mem | grep -i $current_user | head -n "$process_count"
else
    echo "Invalid choice. Please enter 'c' for CPU or 'm' for memory."
fi