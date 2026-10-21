#!/usr/bin/env bash

SCRIPT_PATH="$(realpath "$0")"
export PATH="$HOME/.local/bin:$PATH"

# Sub-function: Search and install packages via fzf
install_custom_package() {
    SELECTED_PKG=$(apt-cache search . | fzf --prompt="Select APT Package: " --preview 'apt-cache show {1}' | awk '{print $1}')
    
    if [ -n "$SELECTED_PKG" ]; then
        echo "Installing $SELECTED_PKG..."
        sudo apt update && sudo apt install -y "$SELECTED_PKG"
        read -n 1 -s -r -p "Press any key to close..."
    fi
}

# Sub-function: Remove installed packages via fzf
remove_package() {
    SELECTED_PKG=$(dpkg-query -W -f='${binary:Package}\t${Summary}\n' | fzf --prompt="Select Package to Remove: " --preview 'apt-cache show {1}' | awk '{print $1}')
    
    if [ -n "$SELECTED_PKG" ]; then
        echo "Removing $SELECTED_PKG..."
        sudo apt remove --purge -y "$SELECTED_PKG" && sudo apt autoremove -y
        read -n 1 -s -r -p "Press any key to close..."
    fi
}

# Sub-function: Pick an installed web app via fuzzel and launch it
launch_webapp() {
    local apps
    apps=$(grep -l -E '(X-WebApp-URL|webapp-launch|--app=)' "$HOME"/.local/share/applications/*.desktop 2>/dev/null \
        | xargs -r -n1 basename | sed 's/\.desktop$//')

    if [ -z "$apps" ]; then
        notify-send "Web Apps" "No installed web apps found." 2>/dev/null
        exit 0
    fi

    local app
    app=$(echo "$apps" | fuzzel --dmenu --prompt "Launch Web App: ")
    [ -n "$app" ] && gtk-launch "$app"
}

# Subcommand routing
case "$1" in
    "--run-install")
        install_custom_package
        exit 0
        ;;
    "--run-remove")
        remove_package
        exit 0
        ;;
    "--run-update")
        sudo apt update && sudo apt upgrade -y
        read -n 1 -s -r -p "Press any key to close..."
        exit 0
        ;;
    "--run-curated")
        sudo apt update && sudo apt install -y "$2"
        read -n 1 -s -r -p "Press any key to close..."
        exit 0
        ;;
    "--webapp-list")
        webapp-manager list
        read -n 1 -s -r -p "Press any key to close..."
        exit 0
        ;;
esac

# APT submenu
apt_menu() {
    local options="Install APT Pkg\nRemove APT Pkg\nUpdate APT Pkgs"
    local choice
    choice=$(echo -e "$options" | fuzzel --dmenu --prompt "APT: ")

    case "$choice" in
        "Install APT Pkg")
            alacritty -e "$SCRIPT_PATH" --run-install
            ;;
        "Remove APT Pkg")
            alacritty -e "$SCRIPT_PATH" --run-remove
            ;;
        "Update APT Pkgs")
            alacritty -e "$SCRIPT_PATH" --run-update
            ;;
    esac
}

# Web App submenu
webapp_menu() {
    local options="Install Web App\nLaunch Web App\nList Web Apps\nManage Web Apps\nRemove Web App"
    local choice
    choice=$(echo -e "$options" | fuzzel --dmenu --prompt "Web Apps: ")

    case "$choice" in
        "Install Web App")
            alacritty -e webapp-install
            ;;
        "Launch Web App")
            launch_webapp
            ;;
        "List Web Apps")
            alacritty -e "$SCRIPT_PATH" --webapp-list
            ;;
        "Manage Web Apps")
            alacritty -e bash -c 'webapp-manager; exec bash'
            ;;
        "Remove Web App")
            alacritty -e webapp-remove
            ;;
    esac
}

# Main Fuzzel Menu
MAIN_OPTIONS="APT\nWeb Apps"

CHOICE=$(echo -e "$MAIN_OPTIONS" | fuzzel --dmenu --prompt "Debian App Menu: ")

case "$CHOICE" in
    "APT")
        apt_menu
        ;;
    "Web Apps")
        webapp_menu
        ;;
    *)
        exit 0
        ;;
esac
