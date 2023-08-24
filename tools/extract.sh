#!/bin/bash

# Function to display the header
display_header() {
    clear
    echo "============================================="
    echo "      Archive Extractor - File Extraction     "
    echo "============================================="
    echo
}

# Function to display the main menu
display_menu() {
    echo "Please select an option:"
    echo "1. Extract all files"
    echo "2. Quit"
    echo
    echo -n "Enter your choice (1-2): "
}

# Function to extract the files
extract_files() {
    for file in "$directory"/*.{zip,rar}; do
        if [[ -f "$file" ]]; then
            folder="${file%.*}"  # Get the file name without extension
            folder="${folder##*/}"  # Get the folder name
            mkdir -p "$directory/$folder"  # Create the folder if it doesn't exist

            echo "Extracting $file to $folder..."
            if [[ "$file" == *.zip ]]; then
                unzip "$file" -d "$directory/$folder"
            elif [[ "$file" == *.rar ]]; then
                unrar x "$file" "$directory/$folder"
            fi
            echo "Extraction completed."
            echo
        fi
    done
}

# Main program

directory="./"  # Replace with the path to your folder

while true; do
    display_header
    display_menu

    read choice
    case $choice in
        1)
            display_header
            echo "Extracting files..."
            extract_files
            echo "All files extracted."
            echo
            read -p "Press Enter to continue..."
            ;;
        2)
            display_header
            echo "Exiting..."
            echo
            exit 0
            ;;
        *)
            display_header
            echo "Invalid choice. Please try again."
            echo
            read -p "Press Enter to continue..."
            ;;
    esac
done
