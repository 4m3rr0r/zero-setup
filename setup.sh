#!/bin/bash

# name   : zero-setup
# url    : https://github.com/4m3rr0r/zero-setup
# author : 4m3rr0r


# Define colors
    
    RED='\033[1;31m'
    RED1='\033[5;31m'
    green='\033[1;32m'
    GREEN='\033[0;32m'
    blue='\033[1;34m'
    BULE='\033[0;34m'
    cyan='\033[1;36m'
    reset='\033[0m' # Reset color to default
    RESET='\033[0m'


# Function for banner 

function banner() {
echo ""
echo ""
echo -e "\033[31m ▀▀█ █▀▀ █▀▄ █▀█     █▀▀ █▀▀ ▀█▀ █ █ █▀█"
echo -e         " ▄▀  █▀▀ █▀▄ █ █ ▄▄▄ ▀▀█ █▀▀  █  █ █ █▀▀"
echo -e         " ▀▀▀ ▀▀▀ ▀ ▀ ▀▀▀     ▀▀▀ ▀▀▀  ▀  ▀▀▀ ▀ [v1.0],[4m3rr0r] \033[0m"

}


function osint(){

# List of tools to install
tools=("theharvester" "maltego")

# Function to check if a tool is installed
check_tool() {
    if which "$1" &> /dev/null
    then
        return 0
    else
        return 1
    fi
}


# Loop through each tool

for tool in "${tools[@]}"
do
    # Check if the tool is already installed
    if command -v "$tool" &> /dev/null
    then
        # echo "$tool is already installed."
        echo -e ${GREEN} "[-]" $tool "is already install on your system"  ${RESET}   
    else
            # Install the tool using apt
            echo -e ${RED} "[+] Installing" $tool ${RED1} "please wait" ${RESET}
            sudo apt install -y "$tool" &> /dev/null
            echo -e ${GREEN} "[-]" $tool "Install complete" ${RESET}

    fi
done

}



function Cryptography(){

# List of tools to install
tools=("hashid" "hashcat")

# Function to check if a tool is installed
check_tool() {
    if which "$1" &> /dev/null
    then
        return 0
    else
        return 1
    fi
}


# Loop through each tool

for tool in "${tools[@]}"
do
    # Check if the tool is already installed
    if command -v "$tool" &> /dev/null
    then
        # echo "$tool is already installed."
        echo -e ${GREEN} "[-]" $tool "is already install on your system"  ${RESET}   
    else
            # Install the tool using apt
            echo -e ${RED} "[+] Installing" $tool ${RED1} "please wait" ${RESET}
            sudo apt install -y "$tool" &> /dev/null
            echo -e ${GREEN} "[-]" $tool "Install complete" ${RESET}

    fi
done

#john
if ! which john > /dev/null;
then 
    echo -e ${RED} "[+]Installing john " ${RED1} "please wait" ${RESET}
    sudo  apt-get install john-data -y > /dev/null;
    echo -e ${GREEN} "[-]john Install complete" ${RESET}
else
    echo -e ${GREEN} "[-]john is already install on your system"  ${RESET}      
fi

#haiti
if ! which haiti > /dev/null;
then 
    echo -e ${RED} "[+]Installing haiti" ${RED1} "please wait" ${RESET}  
    sudo gem install haiti-hash > /dev/null;
    echo -e ${GREEN} "[-]haiti Install complete" ${RESET}  
else
    echo -e ${GREEN} "[-]haiti is already install on your system"  ${RESET}      
fi

}


function Steganography(){

# List of tools to install
tools=("binwalk" "zsteg" "steghide" "sonic-visualiser" "fcrackzip" "")

# Function to check if a tool is installed
check_tool() {
    if which "$1" &> /dev/null
    then
        return 0
    else
        return 1
    fi
}

# Loop through each tool

for tool in "${tools[@]}"
do
    # Check if the tool is already installed
    if command -v "$tool" &> /dev/null
    then
        # echo "$tool is already installed."
        echo -e ${GREEN} "[-]" $tool "is already install on your system"  ${RESET}   
    else
            # Install the tool using apt
            echo -e ${RED} "[+] Installing" $tool ${RED1} "please wait" ${RESET}
            sudo apt install -y "$tool" &> /dev/null
            echo -e ${GREEN} "[-]" $tool "Install complete" ${RESET}

    fi
done

#stegsolve
if ! which stegsolve > /dev/null;
then 
    echo -e ${RED} "[+]Installing stegsolve " ${RED1} "please wait" ${RESET}

    mkdir stegsolve
    wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar
    chmod +x stegsolve.jar
    mv stegsolve.jar ./stegsolve
    sudo mv stegsolve /opt 
    sudo mv tools/stegsolve /usr/local/bin 

    echo -e ${GREEN} "[-]stegsolve Install complete" ${RESET}
else
    echo -e ${GREEN} "[-]stegsolve is already install on your system"  ${RESET}      
fi


#exiftool
if ! which exiftool > /dev/null;
then 
    echo -e ${RED} "[+]Installing exiftool" ${RED1} "please wait" ${RESET}
    sudo  apt-get install libimage-exiftool-perl -y > /dev/null;
    echo -e ${GREEN} "[-]exiftool Install complete" ${RESET}
else
    echo -e ${GREEN} "[-]exiftool is already install on your system"  ${RESET}      
fi

#stegoveritas
if ! which stegoveritas > /dev/null;
then 
    echo -e ${RED} "[+]Installing stegoveritas " ${RED1} "please wait" ${RESET}
    sudo pip3 install stegoveritas -y > /dev/null;
    sudo stegoveritas_install_deps -y > /dev/null;
    echo -e ${GREEN} "[-]stegoveritas Install complete" ${RESET}
else
    echo -e ${GREEN} "[-]stegoveritas is already install on your system"  ${RESET}      
fi


}






function forensics(){

#volatility-2
if ! which volatility > /dev/null;
then 
    echo -e ${RED} "[+]Installing volatility " ${RED1} "please wait" ${RESET}
    wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip
    unzip volatility_2.6_lin64_standalone.zip > /dev/null;
    mv volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone volatility > /dev/null;
    mv volatility /usr/local/bin
    rm -rvf volatility_2.6_lin64_standalone.zip > /dev/null;
    rm -rvf volatility_2.6_lin64_standalone > /dev/null;
    git clone https://github.com/5h31kh/volatility-plugins.git > /dev/null;
    mv  volatility-plugins /opt
    echo -e ${GREEN} "[-] volatility Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] volatility is already install on your system"  ${RESET}      
fi

}

function other() {

# List of tools to install
tools=("curl" "git" "wget" "git" "python2" "python3" "python3-pip" "gcc" "jq" "host" "dig" "make"
"gnome-disk-utility" "seclists")

# Function to check if a tool is installed
check_tool() {
    if which "$1" &> /dev/null
    then
        return 0
    else
        return 1
    fi
}


# Loop through each tool

for tool in "${tools[@]}"
do
    # Check if the tool is already installed
    if command -v "$tool" &> /dev/null
    then
        # echo "$tool is already installed."
        echo -e ${GREEN} "[-]" $tool "is already install on your system"  ${RESET}   
    else
            # Install the tool using apt
            echo -e ${RED} "[+] Installing" $tool ${RED1} "please wait" ${RESET}
            sudo apt install -y "$tool" &> /dev/null
            echo -e ${GREEN} "[-]" $tool "Install complete" ${RESET}

    fi
done


#server
if ! which server > /dev/null;
then 
    echo -e ${RED} "[+] Installing server " ${RED1} "please wait" ${RESET}
        sudo mv tools/server /usr/local/bin > /dev/null;
        sudo chmod +x /usr/local/bin/server
    echo -e ${GREEN} "[-]server Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] server is already install on your system"  ${RESET}      
fi

#winpslist
if ! which winpslist > /dev/null;
then 
    echo -e ${RED} "[+] Installing winpslist " ${RED1} "please wait" ${RESET}
    sudo mv tools/winpslist /usr/local/bin 
    sudo chmod +x /usr/local/bin/winpslist
    echo -e ${GREEN} "[-]dewinpslisto Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] winpslist is already install on your system"  ${RESET}      
fi

#mac-changerPro
if ! which mac-changerPro > /dev/null;
then 
    echo -e ${RED} "[+] Installing mac-changerPro " ${RED1} "please wait" ${RESET}
    git clone https://github.com/4m3rr0r/mac-changerPro.git  > /dev/null;
    sudo mv mac-changerPro/mac-changerPro /usr/local/bin 
    sudo chmod +x /usr/local/bin/mac-changerPro
    sudo rm -rvf mac-changerPro  > /dev/null;
    echo -e ${GREEN} "[-]mac-changerPro Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] mac-changerPro is already install on your system"  ${RESET}      
fi

#debInjector
if ! which debInjector > /dev/null;
then 
    echo -e ${RED} "[+] Installing debInjector " ${RED1} "please wait" ${RESET}
    git clone https://github.com/4m3rr0r/debInjector.git  > /dev/null;
    sudo mv debInjector/debInjector /usr/local/bin 
    sudo chmod +x /usr/local/bin/debInjector
    sudo rm -rvf debInjector  > /dev/null;
    echo -e ${GREEN} "[-]debInjector Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] debInjector is already install on your system"  ${RESET}      
fi



#vpn
if ! which debInjector > /dev/null;
then 
    echo -e ${RED} "[+] Installing debInjector " ${RED1} "please wait" ${RESET}
    sudo mv /tools/vpn /usr/local/bin
    sudo chmod +x /usr/local/bin/vpn
    sudo rm -rvf debInjector  > /dev/null;
    echo -e ${GREEN} "[-]debInjector Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] debInjector is already install on your system"  ${RESET}      
fi


}


# Function for all tools list

function list() {
    declare -A categories

    categories["${blue}Cryptography ${reset}"]="${blue}[hashid],[haiti],[hashcat],[john]${reset}" # Blue
    categories["${green}Steganography${reset}"]="${green}[binwalk],[zsteg],[Steghide],[exiftool],[sonic-visualiser],[fcrackzip],[stegsolve],[stegoveritas]${reset}" # Green
    categories["${yellow}OSINT${reset}"]="${yellow}[TheHarvester],[Maltego]${reset}" # Yellow
    categories["${cyan}Digital Forensics ${reset}"]="${cyan}[autopsy],[volatility2],[volatility_plugins],[volatility3]${reset}" # Cyan
    categories["${magenta}Other ${reset} "]="${magenta}[server],[winpslist],[mac-changerPro],[debInjector],[seclists]${reset}" # Magenta

    for category in "${!categories[@]}"; do
        echo -e "${categories[$category]}" | awk -v cat="$category" '{print "\033[1m----" cat "----\033[0m\n"; print $0 "\n"}'
    done
}




banner
## root checking

if [[ ${UID} != 0 ]] 
then 
    echo -e " ${RED1} Please run as root ${RESET} "
    exit 1
fi

## menu

if [[ ${1} == "-h" ]] || [[ ${1} == "--help" ]] 
then 
    echo "Usage: ${0:2} -a"
    echo ""
    echo ""
    echo "  -h,  --help           Display this help menu"
    echo "  -v,  --version        show program's version number   "
    echo "  -l,  --list           all tools list"
    echo "  -a,  --all            to install all tools          "
    echo "  -c,  --Cryptography   to install Cryptography tools"
    echo "  -o,  --OSINT          to install OSINT tools"
    echo "  -s,  --Steganography  to install Steganography tools "
    echo "  -f,  --Forensics      to install Forensics tools"
    echo "  -ot, --other          to install some important tools"

    exit 1
elif [[ ${1} == "-v" ]] || [[ ${1} == "--version" ]]
then
    echo -e "${YELLOW} program version 1.1.0 ${RESET} "
elif [[ ${1} == "-a" ]] || [[ ${1} == "--all" ]] || [[ ${1} == "all" ]]
then
    
    Cryptography
    Steganography
    osint
    other
    forensics

elif [[ ${1} == "-c" ]] || [[ ${1} == "--Cryptography" ]] || [[ ${1} == "Cryptography" ]]
then

    Cryptography

elif [[ ${1} == "-o" ]] || [[ ${1} == "--OSINT" ]] || [[ ${1} == "OSINT" ]]
then
    echo "install OSINT"
elif [[ ${1} == "-s" ]] || [[ ${1} == "--Steganography" ]] || [[ ${1} == "Steganography" ]]
then
        osint

elif [[ ${1} == "-f" ]] || [[ ${1} == "--Forensics" ]] || [[ ${1} == "Forensics" ]]
then
        forensics
elif [[ ${1} == "-ot" ]] || [[ ${1} == "--other" ]] || [[ ${1} == "other" ]]
then
        other
elif [[ ${1} == "-l" ]] || [[ ${1} == "--list" ]] || [[ ${1} == "list" ]]
then
        list
else
    echo ""
    echo -e "\033[31mError: Invalid option\033[0m"
    echo ""
    echo "Try '$0 -h or --help' for more information."
    exit 1    
fi
#End
