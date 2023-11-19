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


# List of OSINT tools
OSINT_TOOLS=("theharvester" "maltego" "comming soon")

# List of Cryptography tools
CRYPTO_TOOLS=("hashid" "hashcat" "john" "haiti" "CyberChef")

# List of Steganography tools
STEGNO_TOOLS=("binwalk" "zsteg" "steghide" "sonic-visualiser" "fcrackzip" "stegsolve" "exiftool" "stegoveritas")

# List of forensics tools

FOREN_TOOLS=("volatility-2" "Volatility Plugins" "volatility-3" "autospy" "comming soon")

BUGHUNT_TOOLS=("fuzz" "gobuster" "nikto" "arjun" "gospider" "dirsearch" "nmap" "dnsx" "wapiti" "assetfinder" "subfinder" "massdns" "sublist3r" "httprobe"
"ffuf" "wfuzz" "nuclei" "gron" "hakrawler" "subjack" "amass" "subfinder" "knockpy" "masscan" "whatweb" "crlf" "sqlmap" "s3scanner" "httpx")

# List of other tools
OTHER_TOOLS=("seclists" "server" "winpslist" "mac-changerPro" "debInjector" "vpn" "gnome-disk-utility")



# Function for banner 
function banner() {
    echo -e "\n${RED} ▀▀█ █▀▀ █▀▄ █▀█     █▀▀ █▀▀ ▀█▀ █ █ █▀█"
    echo -e         " ▄▀  █▀▀ █▀▄ █ █ ▄▄▄ ▀▀█ █▀▀  █  █ █ █▀▀"
    echo -e         " ▀▀▀ ▀▀▀ ▀ ▀ ▀▀▀     ▀▀▀ ▀▀▀  ▀  ▀▀▀ ▀ [v2.0.0]${RESET}" "${GREEN}[4m3rr0r] \n${RESET}"
}

# Function to install a tool
install() {
    local tool="$1"

    if command -v "$tool" &> /dev/null; then
        echo -e "${GREEN} [-] $tool is already installed on your system${RESET}"
    else
        echo -e "${RED} [+] Installing $tool. Please wait...${RESET}"
        sudo apt install -y "$tool" &> /dev/null

        if [ $? -eq 0 ]; then
            echo -e "${GREEN} [-] $tool installation complete${RESET}"
        else
            echo -e "${RED1} [!] Error: $tool installation failed${RESET}"
        fi
    fi
}

# Function for configuring tools
config() {
    install git
    install curl
    install wget
    install python3
    install dig
    install host
    install make
    install gcc
    install jq

    sudo apt install software-properties-common -y -qq &>/dev/null
    sudo apt install --assume-yes p7zip-full &>/dev/null
    sudo apt install python3-pip -y -qq &>/dev/null
    sudo apt-get install libldns-dev -y -qq &>/dev/null
    sudo add-apt-repository ppa:longsleep/golang-backports -y &>/dev/null
}

# Function for installing OSINT tools
osint() {
    install theharvester
    install maltego
    # Add more OSINT tools soon
}

# Function for installing Cryptography tools
cryptography() {
    install hashid
    install hashcat
  
  #john
if ! which john > /dev/null;
then 
    echo -e ${RED} "[+] Installing john " ${RED1} "please wait" ${RESET}
    sudo  apt-get install john-data -y > /dev/null;
    echo -e ${GREEN} "[-] john Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] john is already install on your system"  ${RESET}      
fi

#haiti
if ! which haiti > /dev/null;
then 
    echo -e ${RED} "[+] Installing haiti" ${RED1} "please wait" ${RESET}  
    sudo gem install haiti-hash > /dev/null;
    echo -e ${GREEN} "[-] haiti Install complete" ${RESET}  
else
    echo -e ${GREEN} "[-] haiti is already install on your system"  ${RESET}      
fi


}


Steganography(){

    install binwalk
    install zsteg
    install steghide
    install sonic-visualiser
    install fcrackzip


#stegsolve
if ! which stegsolve > /dev/null;
then 
    echo -e ${RED} "[+] Installing stegsolve " ${RED1} "please wait" ${RESET}

    mkdir stegsolve
    wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar
    chmod +x stegsolve.jar
    mv stegsolve.jar ./stegsolve
    sudo mv stegsolve /opt 
    sudo mv tools/stegsolve /usr/local/bin 

    echo -e ${GREEN} "[-] stegsolve Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] stegsolve is already install on your system"  ${RESET}      
fi


#exiftool
if ! which exiftool > /dev/null;
then 
    echo -e ${RED} "[+] Installing exiftool" ${RED1} "please wait" ${RESET}
    sudo  apt-get install libimage-exiftool-perl -y > /dev/null;
    echo -e ${GREEN} "[-] exiftool Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] exiftool is already install on your system"  ${RESET}      
fi

#stegoveritas
if ! which stegoveritas > /dev/null;
then 
    echo -e ${RED} "[+] Installing stegoveritas " ${RED1} "please wait" ${RESET}
    sudo pip3 install stegoveritas -y > /dev/null;
    sudo stegoveritas_install_deps -y > /dev/null;
    echo -e ${GREEN} "[-] stegoveritas Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] stegoveritas is already install on your system"  ${RESET}      
fi


}

forensics(){

#volatility-2
if ! which volatility > /dev/null;
then 
    echo -e ${RED} "[+] Installing volatility " ${RED1} "please wait" ${RESET}
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



BugHunting(){

install fuzz
install gobuster
install nikto
install arjun
install gospider
install dirsearch
install nmap
install dnsx
install wapiti
install assetfinder
install subfinder
install massdns
install sublist3r
install httprobe
install ffuf
install wfuzz
install nuclei
install gron
install hakrawler
install subjack
install amass
install subfinder
install knockpy
install masscan
install whatweb
install crlf
install sqlmap
install s3scanner


#httpx
if ! which httpx > /dev/null;
then 
    echo -e ${RED} "[+] Installing httpx " ${RED1} "please wait" ${RESET}
    sudo apt install httpx-toolkit -y -q  > /dev/null;
    echo -e ${GREEN} "[-] httpx Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] httpx is already install on your system"  ${RESET}      
fi


}


other() {


install seclists
install gnome-disk-utility

echo -e ${RED} "[+] Installing server " ${RED1} "please wait" ${RESET}
sudo apt insall gnome-disk-utility -y -qq &>/dev/null
echo -e ${GREEN} "[-] server Install complete" ${RESET}

#server
if ! which server > /dev/null;
then 
    echo -e ${RED} "[+] Installing server " ${RED1} "please wait" ${RESET}
        sudo mv tools/server /usr/local/bin > /dev/null;
        sudo chmod +x /usr/local/bin/server
    echo -e ${GREEN} "[-] server Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] server is already install on your system"  ${RESET}      
fi

#winpslist
if ! which winpslist > /dev/null;
then 
    echo -e ${RED} "[+] Installing winpslist " ${RED1} "please wait" ${RESET}
    sudo mv tools/winpslist /usr/local/bin 
    sudo chmod +x /usr/local/bin/winpslist
    echo -e ${GREEN} "[-] winpslist Install complete" ${RESET}
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
    echo -e ${GREEN} "[-] mac-changerPro Install complete" ${RESET}
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
    echo -e ${GREEN} "[-] debInjector Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] debInjector is already install on your system"  ${RESET}      
fi



#vpn
if ! which vpn > /dev/null;
then 
    echo -e ${RED} "[+] Installing vpn " ${RED1} "please wait" ${RESET}
    sudo mv /tools/vpn /usr/local/bin  2> /dev/null;
    sudo chmod +x /usr/local/bin/vpn  2> /dev/null;
    sudo rm -rvf vpn  2> /dev/null;
    echo -e ${GREEN} "[-] vpn Install complete" ${RESET}
else
    echo -e ${GREEN} "[-] vpn is already install on your system"  ${RESET}      
fi




}



# Function to display a list of tools for a given category
list_tools() {
    local category_name="$1"
    local tools=("${!category_name}")

    echo -e "${cyan}List of ${category_name} Tools:${RESET}"
    for tool in "${tools[@]}"; do
        echo -e "${GREEN} - ${tool}${RESET}"
    done
}
# Main function to execute the script
main() {
    banner

    # Check for root privileges
    if [[ ${UID} != 0 ]]; then 
        echo -e "${RED1} Please run as root ${RESET}"
        exit 1
    fi

    # Parse command line options
    case ${1} in
        -h | --help)
            echo "Usage: ${0:2} -a"
            echo "  -h,  --help           Display this help menu"
            echo "  -v,  --version        Show program's version number"
            echo "  -a,  --all            Install all tools"
            echo "  -c,  --cryptography   Install Cryptography tools"
            echo "  -o,  --osint          Install OSINT tools"
            echo "  -b,  --bughunting     Install bughunting tools"
            echo "  -f,  --forensics      Install Forensics tools"
            echo "  -ot, --other          Install other tools"
            exit 1
            ;;
        -v | --version)
            echo -e "${cyan} Program version 2.0.0 ${RESET}"
            ;;
        
         -l | --list)
            list_tools "OSINT_TOOLS[@]"
            list_tools "CRYPTO_TOOLS[@]"
            list_tools "STEGNO_TOOLS[@]"
            list_tools "FOREN_TOOLS[@]"
            list_tools "BUGHUNT_TOOLS[@]"
            list_tools "OTHER_TOOLS[@]"
            ;;
        
        -a | --all)
            config
            osint
            cryptography
            forensics
            BugHunting
            other
            ;;
        -c | --cryptography)
            cryptography
            ;;
        -o | --osint)
            osint
            ;;
        -b | --bughunting)
            BugHunting
            ;;
        -f | --forensics)
            forensics
            ;;
        -ot | --other)
            other
            ;;
        *)
            echo -e "\033[31mError: Invalid option\033[0m"
            echo "Try '$0 -h or --help' for more information."
            exit 1
            ;;
    esac
}

# Execute the main function with command line arguments
main "$@"
