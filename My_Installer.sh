#!/bin/bash

# My_Istaller by  :  Tvanbael
# Version         :  1.1.2
# Created the     :  2024-02-14
# Last update     :  2024-02-14


banner () {
    clear
    echo -e "████████████████████████████████████████████████████████████████████████████████████████████████████"
    echo -e "█                                                                                                  █"
    echo -e "█  ███    ███ ██    ██      ██ ███    ██ ███████ ████████  █████  ██      ██      ███████ ██████   █"
    echo -e "█  ████  ████  ██  ██       ██ ████   ██ ██         ██    ██   ██ ██      ██      ██      ██   ██  █"
    echo -e "█  ██ ████ ██   ████        ██ ██ ██  ██ ███████    ██    ███████ ██      ██      █████   ██████   █"
    echo -e "█  ██  ██  ██    ██         ██ ██  ██ ██      ██    ██    ██   ██ ██      ██      ██      ██   ██  █"
    echo -e "█  ██      ██    ██         ██ ██   ████ ███████    ██    ██   ██ ███████ ███████ ███████ ██   ██  █"
    echo -e "█                                                                                                  █"
    echo -e "████████████████████████████████████████████████████████████████████████████████████████████████████"
    echo -e "█                                                                         Version       1.0.0      █"
    echo -e "█                                                                         Last Update   2024-02-12 █"
    echo -e "█                                                                         By            Tvanbael   █"
    echo -e "████████████████████████████████████████████████████████████████████████████████████████████████████"
    echo -e ""
}

# ANSI color codes
RESET="\033[0m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
BG_BLACK="\033[40m"
BG_RED="\033[41m"
BG_GREEN="\033[42m"
BG_YELLOW="\033[43m"
BG_BLUE="\033[44m"
BG_MAGENTA="\033[45m"
BG_CYAN="\033[46m"
BG_WHITE="\033[47m"

# Unicode Emoji
CHECK_MARK="\xE2\x9C\x85"
CROSS_MARK="\xE2\x9D\x8C"
RIGHT_ARROW="\xe2\x9e\x9c"
UP_ARROW="\xE2\xAC\x86"
DOWN_ARROW="\xE2\xAC\x87"

# Variables
GHIDRA_VAR=false
DISCORD_VAR=false
OBSIDIAN_VAR=false
MULTI_TOOLS_VAR=false
BURP_PRO_VAR=false                                                                                     #add new variable
POS_VAR=1

exit_mode() {
    tput cnorm
    clear
    exit 0
}

toggle_space() {
    local var_names=("GHIDRA_VAR" "DISCORD_VAR" "OBSIDIAN_VAR" "MULTI_TOOLS_VAR" "BURP_PRO_VAR")      #add new variable
    local pos_var=$((POS_VAR - 1))
    local callback="$1"
    local condition="$2"

    if [ $pos_var -eq 5 ]; then                                                                       # pos +=1
        start_install
        exit_mode
    fi
    if [ "${condition}" = "2" ]; then
        print_information_packets       
    fi
    if [ "${!var_names[$pos_var]}" != true ]; then
        eval "${var_names[$pos_var]}=true"
    else
        eval "${var_names[$pos_var]}=false"
    fi
    "$callback"
}

toggle_left() {
    local var_names=("GHIDRA_VAR" "DISCORD_VAR" "OBSIDIAN_VAR" "MULTI_TOOLS_VAR" "BURP_PRO_VAR")                    #add new variable
    local pos_var=$((POS_VAR - 1))
    local callback="$1"

    for var_name in "${var_names[@]}"; do
        eval "$var_name=false"
    done
    POS_VAR=1
    menu
}

toggle_up() {
    local callback="$1"
    if [ $POS_VAR -gt 1 ]; then
        POS_VAR=$((POS_VAR-1))
        "$callback"
    fi
}

toggle_down() {
    local callback="$1"
    local condition="$2"
    if [ $POS_VAR -lt "$condition" ]; then
        POS_VAR=$((POS_VAR+1))
        "$callback"
    fi
}

print_information_packets() {
    clear
    banner
    echo -e "Information packets"
    echo -e ""

    # Infos Ghidra
    echo -e "${BLUE}Ghidra${RESET} (With OpenJDK 17)"
    echo -e "${GREEN}________________________${RESET}"
    echo -e ""
    echo -e "Ghidra is a software reverse engineering (SRE) framework created and maintained by the National Security Agency"
    echo -e "Research Directorate. This framework includes a suite of full-featured, high-end software analysis tools that"
    echo -e "enable users to analyze compiled code on a variety of platforms including Windows, macOS, and Linux. Capabilities"
    echo -e "include disassembly, assembly, decompilation, graphing, and scripting, along with hundreds of other features."
    echo -e "Ghidra supports a wide variety of processor instruction sets and executable formats and can be run in both"
    echo -e "user-interactive and automated modes. Users may also develop their own Ghidra extension components and/or"
    echo -e "scripts using Java or Python."
    echo -e ""
    echo -e "release used: 11.0.1"
    echo -e ""
    echo -e "Link   : https://ghidra-sre.org/"
    echo -e "GitHub : https://github.com/NationalSecurityAgency/ghidra"
    echo -e ""
    echo -e ""

    # Infos Discord
    echo -e "${BLUE}Discord${RESET}"
    echo -e "${GREEN}_______${RESET}"
    echo -e ""
    echo -e "Discord is a proprietary freeware VoIP application and digital distribution platform designed for video gaming"
    echo -e "communities, that specializes in text, image, video and audio communication between users in a chat channel."
    echo -e "Discord runs on Windows, macOS, Android, iOS, Linux, and in web browsers. As of December 2021, the platform"
    echo -e "has over 150 million monthly active users. The concept of Discord came from Jason Citron, who had founded"
    echo -e "OpenFeint, a social gaming platform for mobile games. He found that some VoIP options required players to"
    echo -e "type in IP addresses just to connect, and some did not have a way to see who was online. This led to the"
    echo -e "creation of a chat service that was much more user-friendly, and Discord was born. Discord was publicly"
    echo -e "released in May 2015. According to Citron, the only area that they pushed Discord into was for the gaming"
    echo -e "community, as they found the VoIP options in the market at the time were not user-friendly, but other"
    echo -e "communities began to use it for other purposes, such as writing groups, and learning groups."
    echo -e ""
    echo -e "release used: 0.0.43"
    echo -e ""
    echo -e "Link  : https://discord.com/"
    echo -e ""
    echo -e ""

    # Infos Obsidian
    echo -e "${BLUE}Obsidian${RESET}"
    echo -e "${GREEN}________${RESET}"
    echo -e ""
    echo -e "Obsidian is a powerful knowledge base that works on top of a local folder of plain text Markdown files. Created"
    echo -e "with productivity and flexibility in mind, Obsidian allows its users to connect their thoughts and ideas"
    echo -e "through links, turning their collections of notes into a rich network of knowledge. Whether you're a writer,"
    echo -e "researcher, student, or someone who simply wants to organize their thoughts, Obsidian's toolkit empowers you"
    echo -e "to work more effectively. It supports a variety of plugins and themes developed by the community, enabling"
    echo -e "customization to suit any workflow or aesthetic preference. With Obsidian, your data sits in your own hands,"
    echo -e "in files that you can read, edit, and store however you like. Its capabilities extend beyond note-taking to"
    echo -e "include features such as backlinking, graph view, custom CSS styling, and an API for plugin development,"
    echo -e "making it a versatile tool for personal knowledge management and a powerful companion for intellectual work."
    echo -e ""
    echo -e "release used: 1.5.3"
    echo -e ""
    echo -e "Link  : https://obsidian.md/"
    echo -e ""
    echo -e ""

    # Infos Multi Tools
    echo -e "${BLUE}Multi Tools${RESET}"
    echo -e "${GREEN}___________${RESET}"
    echo -e ""
    echo -e "A collection of tools for Cyber Security"
    echo -e ""
    echo -e "Information coming soon"
    echo -e ""
    echo -e ""

    # Infos BurpSuite Pro
    echo -e "${BLUE}BurpSuite Pro${RESET}"
    echo -e "${GREEN}_____________${RESET}"
    echo -e ""
    echo -e "Burp Suite Pro is an integrated platform for performing security testing of web applications. Developed by"
    echo -e "PortSwigger Web Security, it is designed to provide a comprehensive solution for web application security"
    echo -e "checks. From initial mapping and analysis of an application's attack surface, through to finding and"
    echo -e "exploiting security vulnerabilities, Burp Suite Pro offers a variety of tools tailored for the needs of"
    echo -e "professional penetration testers. Among its core features are an interception proxy, web spider, scanner,"
    echo -e "intruder, repeater, decoder, comparer, and extender. Its powerful scanning engine is highly configurable,"
    echo -e "allowing for automated and manual vulnerability testing with precision. Burp Suite Pro also supports"
    echo -e "extensibility, allowing users to write their own plugins to automate custom tasks. Its rich functionality"
    echo -e "and user-friendly interface have made Burp Suite Pro a favorite among security professionals for identifying,"
    echo -e "tracking, and exploiting web application vulnerabilities effectively and efficiently."
    echo -e ""
    echo -e "release used: Version 17"
    echo -e ""
    echo -e "Link  : https://portswigger.net/burp"
    echo -e ""
    echo -e ""
    echo -e ""

                                                                                                                        # add a new description
    # Wait for user input
    echo -e ""
    read -n 1 -s -r -p "Press any key to continue ..."
    menu
}

print_select_option() {
    tput cuu 6 && tput el
    options=("Ghidra             " "Discord            " "Obsidian           " "BurpSuite Pro      " "Tool CyberSec      " "Validate           ") #add new variable
    vars=("$GHIDRA_VAR" "$DISCORD_VAR" "$OBSIDIAN_VAR" "$MULTI_TOOLS_VAR" "$BURP_PRO_VAR")                              #add new variable

    for i in "${!options[@]}"; do
        option="${options[$i]}"
        var="${vars[$i]}"
        color="${WHITE}"
        if [ $POS_VAR -eq $((i+1)) ]; then
            color="${GREEN}"
            option="${GREEN}[${RESET} ${RIGHT_ARROW}  ${option}"
        else
            option="[    ${option}"
        fi
        if [ "$var" == true ]; then
            status="${CHECK_MARK}"
        else
            status="${CROSS_MARK}"
        fi
        if [ $POS_VAR -eq $((i+1)) ]; then
            echo -e "${color}[ ${status} ]${RESET} - ${option} ${RESET}   ${GREEN}]${RESET}"
        else
            echo -e "${color}[ ${status} ]${RESET} - ${option} ${RESET}   ]"
        fi
    done
}

select_option() {
    print_select_option
    while true; do
        IFS= read -s -n 1 key
        if [[ "$key" == " " ]]; then
            # Vider le buffer
            while read -r -t 0 key; do
                :
            done
            toggle_space select_option
        fi
        
        case "$key" in
            $'\x1b') # Escape Key (for arrow keys)
                read -s -n 1 key
                if [[ "$key" == "[" ]]; then
                    read -s -n 1 key
                    case "$key" in
                        "A") # Top arrow
                            if [ $POS_VAR -gt 1 ]; then
                                toggle_up select_option
                            fi
                            ;;
                        "B") # Down arrow
                            if [ $POS_VAR -lt 6 ]; then                                                                 # add + 1
                                toggle_down select_option 6                                                             # toggle_down + 1
                            fi
                            ;;
                        "D") # Right arrow
                            toggle_left select_option
                            ;;
                    esac
                fi
                ;;
        esac
    done
}

print_select_mode() {
    tput cuu 7 && tput ed # Clear the last 6 lines
    options=("Installation       " "Information Packets" "Exit               ")
    echo ""
    echo ""

    for i in "${!options[@]}"; do
        option="${options[$i]}"
        color="${WHITE}"
        symbol=" - "
        if [ $POS_VAR -eq $((i+1)) ]; then
            if [ $POS_VAR -eq 3 ]; then
                color="${RED}"
                symbol="${CROSS_MARK}"
                echo -e "${color}[ ${symbol}   ${option}${RESET}   ${color}]${RESET}"
            else
                color="${GREEN}"
                symbol="${RIGHT_ARROW}"
                echo -e "${color}[   ${RESET}${symbol}${color}  ${option}${RESET}   ${color}]${RESET}"
            fi
        else
            echo -e "${color}[ ${RESET}${symbol}${color} ${option}${RESET}   ${color}]${RESET}"
        fi
    done
    echo ""
    echo ""
}


select_mode() {
    print_select_mode
    while true; do
        IFS= read -s -n 1 key
        if [[ "$key" == " " ]]; then
            if [ $POS_VAR -eq 3 ]; then
                clear
                exit_mode
            fi
            if [ $POS_VAR -eq 1 ]; then
                toggle_space select_option 1
            elif [ $POS_VAR -eq 2 ]; then
                toggle_space select_option 2
            else
                toggle_space select_option 3
            fi
        fi
        case "$key" in
            $'\x1b')
                read -r -n 2 -s key
                case "$key" in
                    "[A")
                        if [ $POS_VAR -gt 1 ]; then
                            toggle_up select_mode
                        fi
                        ;;
                    "[B")
                        if [ $POS_VAR -lt 3 ]; then
                            toggle_down select_mode 3
                        fi
                        ;;
                esac
                ;;
        esac
    done
}

menu() {
    tput civis
    clear
    banner
    echo -e "For navigation in menu, use arrow ${GREEN}$UP_ARROW${RESET} and ${GREEN}$DOWN_ARROW${RESET}"
    echo -e ""
    echo -e "Select an option with ${GREEN}space${RESET}"
    echo -e ""
    echo -e "Return to the previous menu with ${GREEN}left${RESET}"
    echo -e ""
    echo -e ""
    echo -e ""
    echo -e ""
    echo -e ""
    echo -e ""
    echo -e ""
    select_mode
    select_option
}

start_install() {
    clear
    banner
    echo -e ""
    echo -e "   ${CYAN}Activity logs${RESET}"
    echo -e "   ${CYAN}_____________${RESET}"
    echo -e ""
    echo -e "Work in progress ..."
    echo -e ""

    if [ "$GHIDRA_VAR" == true ]; then
        echo -e "${YELLOW}Installation de Ghidra${RESET}"
        curl -sSL https://raw.githubusercontent.com/Ardcord/Ghidra_install/main/Ghidra_Install.sh > /tmp/Guidra_Install.sh
        chmod +x /tmp/Guidra_Install.sh
        sudo /tmp/Guidra_Install.sh
        rm -rf /tmp/Guidra_Install.sh
        echo -e "${GREEN}Installation of Ghidra done${RESET}"
        sleep 1
    fi

    if [ "$DISCORD_VAR" == true ]; then
        echo -e "${YELLOW}Installation of Discord${RESET}"
        curl -sSL https://raw.githubusercontent.com/Ardcord/Discord_install/main/Discord_Install.sh > /tmp/Discord_Install.sh
        chmod +x /tmp/Discord_Install.sh
        sudo /tmp/Discord_Install.sh
        rm -rf /tmp/Discord_Install.sh
        echo -e "${GREEN}Installation of Discord done${RESET}"
        sleep 1
    fi

    if [ "$OBSIDIAN_VAR" == true ]; then
        echo -e "${YELLOW}Installation of Obsidian{RESET} (Comming soon)"
    fi

    if [ "$MULTI_TOOLS_VAR" == true ]; then
        echo -e "${YELLOW}Installation of Multi Tools{RESET}"
        curl -sSL https://raw.githubusercontent.com/Ardcord/Multi_tools_installer/main/Multi_tools_installer.sh > /tmp/Multi_tools_installer.sh
        chmod +x /tmp/Multi_tools_installer.sh
        sudo /tmp/Multi_tools_installer.sh
        rm -rf /tmp/Multi_tools_installer.sh
        echo -e "${GREEN}Installation of Multi Tools done${RESET}"
    fi

    if [ "$BURP_PRO_VAR" == true ]; then
        echo -e "${YELLOW}Installation of BurpSuite Pro{RESET} (Comming soon)"
    fi

    # press key to continue
    echo -e ""
    read -n 1 -s -r -p "Press any key to exit ..."
    echo -e ""
    echo -e ""
    echo -e "${GREEN}Exit the installer${RESET}"
    sleep 0.5
    tput cuu 1 && tput ed
    echo -e "${GREEN}Exit the installer .${RESET}"
    sleep 0.5
    tput cuu 1 && tput ed
    echo -e "${GREEN}Exit the installer ..${RESET}"
    sleep 0.5
    tput cuu 1 && tput ed
    echo -e "${GREEN}Exit the installer ...${RESET}"
    sleep 0.5
    exit_mode
}

update_clear() {
    clear
    banner
    cp /tmp/My_Installer.sh $TOTAL_PATH_SCRIPT
    if [ $? -eq 0 ]; then
        echo "Script updated successfully"
        exit_mode
    else
        echo "Error occurred while updating the script"
        exit_mode
    fi
}

update() {
    banner
    echo "Updating script..."
    curl -sSL https://raw.githubusercontent.com/Ardcord/My_Installer/main/My_Installer.sh > /tmp/My_Installer.sh

    if diff /tmp/My_Installer.sh $TOTAL_PATH_SCRIPT >/dev/null; then
        echo "The script is already up to date"
        exit_mode
    else
        echo "The script need an update"
        sleep 2
    fi

    # Définir une variable pour stocker la commande de mise à jour
    local command_to_execute=""
    
    command_to_execute='sudo /tmp/My_Installer.sh --update $TOTAL_PATH_SCRIPT'
    # Afficher la commande construite
    echo -e "Commande construite : $command_to_execute"
    
    # Exécuter la commande construite
    eval "$command_to_execute"&
    exit_mode
}


help() {
    banner
    echo -e ""
    echo -e "My_Installer by  :  Tvanbael"
    echo -e "Version          :  1.0.0"
    echo -e "Created the      :  2024-02-12"
    echo -e "Last update      :  2024-02-12"
    echo -e ""
    echo -e "Usage: My_Installer.sh "
    echo -e ""
    echo -e "   Used for maintain and install some tools"
    echo -e ""
    echo -e "Usage: My_Installer.sh [OPTION]"
    echo -e ""
    echo -e "   Options:"
    echo -e "       -u, --update    Update the script"
    echo -e "       -h, --help      Display this help menu"
    echo -e ""
    exit_mode
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    PATH_SCRIPT=$(pwd)
    TOTAL_PATH_SCRIPT="$PATH_SCRIPT/My_Installer.sh"

    case "$1" in
        "")
            menu
            ;;
        "-u" | "--update")
            if [ -z "$2" ]; then
                update
            elif [ ! -f "$2" ]; then
                echo "Invalid file argument. Use -h or --help for help menu."
                exit_mode
            else
                sleep 3
                update_clear "$2"

            fi
            ;;
        "-h" | "--help")
            help
            ;;
        *)
            echo "Invalid argument. Use -h or --help for help menu."
            exit_mode
            ;;
    esac
fi
