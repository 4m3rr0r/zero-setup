#!/bin/bash

# Prompt the user to choose the search option
while true; do
    read -p "Enter search option
1 - Username
2 - Email Address
3 - Domain Name
0 - Exit
->: " option

    case $option in
        0)  # Exit the script
            echo "Exiting..."
            exit 0
            ;;
        1)  # Search by username
            read -p "Enter the username: " search_term
            grep -E ", '$search_term', " Breachforums.vc-CrackingMafia.to.sql | awk -F", " '{print "Email: " $6 "\nUsername: " $2 "\nArgon2i Hash: " $3 "\n--------------------------"}'
            ;;
        2)  # Search by email address
            read -p "Enter the email address: " search_term
            grep -E ", '$search_term', " Breachforums.vc-CrackingMafia.to.sql | awk -F", " '{print "Email: " $6 "\nUsername: " $2 "\nArgon2i Hash: " $3 "\n--------------------------"}'
            ;;
        3)  # Search by domain name
            read -p "Enter the domain name: " search_term
            grep -E "@.*$search_term" Breachforums.vc-CrackingMafia.to.sql  | awk -F", " '{print "Email: " $6 "\nUsername: " $2 "\nArgon2i Hash: " $3 "\n--------------------------"}'
            ;;
        *)  # Invalid option
            echo "Invalid search option!"
            ;;
    esac
done
