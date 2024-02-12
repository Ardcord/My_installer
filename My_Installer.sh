#!/bin/bash

# My_Istaller by  :  Tvanbael
# Version         :  1.0.0
# Created the     :  2024-02-12
# Last update     :  2024-02-12


banner () {
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
OBSIDIAN_VAR=false
MULTI_TOOLS_VAR=false
BURP_PRO_VAR=false
POS_VAR=1

toggle_space() {
    local var_names=("GHIDRA_VAR" "OBSIDIAN_VAR" "MULTI_TOOLS_VAR" "BURP_PRO_VAR")
    local pos_var=$((POS_VAR - 1))
    local callback="$1"

    if [ $pos_var -eq 4 ]; then
        start_install
        exit 0
    fi
    if [ "${callback}" == "select_option" ]; then
        if [ "${pos_var}" -eq 1 ]; then
            print_information_packets
        fi
    fi
    if [ "${!var_names[$pos_var]}" != true ]; then
        eval "${var_names[$pos_var]}=true"
    else
        eval "${var_names[$pos_var]}=false"
    fi
    "$callback"
}

toggle_left() {
    local var_names=("GHIDRA_VAR" "OBSIDIAN_VAR" "MULTI_TOOLS_VAR" "BURP_PRO_VAR")
    local pos_var=$((POS_VAR - 1))
    local callback="$1"

    if [ "${!var_names[$pos_var]}" == false ]; then
        var_names[1]=false
        var_names[2]=false
        var_names[3]=false
        var_names[4]=false
        menu
    fi
    if [ "${!var_names[$pos_var]}" == true ]; then
        eval "${var_names[$pos_var]}=false"
    fi
    "$callback"
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
    # Wait for user input
    read -n 1 -s -r -p "Press any key to continue ..."
    menu
}

print_select_option() {
    tput cuu 5 && tput el
    options=("Ghidra             " "Obsidian           " "BurpSuite Pro      " "Tool CyberSec      " "Validate           ")
    vars=("$GHIDRA_VAR" "$OBSIDIAN_VAR" "$MULTI_TOOLS_VAR" "$BURP_PRO_VAR")

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
                            if [ $POS_VAR -lt 5 ]; then
                                toggle_down select_option 5
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
    tput cuu 6 && tput ed # Clear the last 6 lines
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
}

select_mode() {
    print_select_mode
    while true; do
        IFS= read -s -n 1 key
        if [[ "$key" == " " ]]; then
            if [ $POS_VAR -eq 3 ]; then
                clear
                exit 0
            fi
            toggle_space select_option
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
    echo -e "For navigation in menu, use arrow $UP_ARROW and $DOWN_ARROW"
    echo -e ""
    echo -e "Select an option with ${GREEN}space"
    echo -e ""
    echo -e "Return to the previous menu with ${GREEN}left${RESET}"
    echo -e ""
    echo -e ""
    echo -e ""
    echo -e ""
    echo -e ""
    select_mode
    select_option
    echo "debug 3"
}

start_install() {
    echo -e "████████████████████████████████████████████████████████████████████████████████████████████████████"
    echo -e "   ${CYAN}Activity logs${RESET}"
    echo -e "████████████████████████████████████████████████████████████████████████████████████████████████████"
    echo -e "Work in progress ..."
    echo -e ""
    if [ "$GHIDRA_VAR" == true ]; then
        echo "${YELLOW}Installation de Ghidra${RESET}"
        curl -sSL https://raw.githubusercontent.com/Ardcord/Ghidra_install/main/Ghidra_Install.sh > /tmp/Guidra_Install.sh
        chmod +x /tmp/Guidra_Install.sh
        sudo /tmp/Guidra_Install.sh
        rm -rf /tmp/Guidra_Install.sh
    fi
    if [ "$OBSIDIAN_VAR" == true ]; then
        echo "${YELLOW}Installation of Obsidian{RESET} (Comming soon)"
    fi
    if [ "$MULTI_TOOLS_VAR" == true ]; then
        echo "${YELLOW}Installation of Multi Tools{RESET} (Comming soon)"
    fi
    if [ "$BURP_PRO_VAR" == true ]; then
        echo "${YELLOW}Installation of BurpSuite Pro{RESET} (Comming soon)"

    fi
    echo -e "████████████████████████████████████████████████████████████████████████████████████████████████████"
    echo -e "${GREEN}Installation clear"
    exit 0
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    menu
fi
