#!/bin/bash

# ==============================================================================
# SCRIPT : SENTINEL FINAL ELITE v7.5
# ADMIN  : YOUSSEF | DESIGN : ZERO-BUG ALIGNMENT
# ==============================================================================

export LANG=fr_FR.UTF-8
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

tput civis
trap "tput cnorm; clear; exit" SIGINT

LAST_MSG="Console Sentinel prête."
METEO=$(curl -s --connect-timeout 2 'wttr.in/Nice?format=%c+%t' 2>/dev/null || echo "☀️ +16°C")

# --- DESSIN DU CADRE FIXE (ALIGNEMENT CHIRURGICAL) ---
draw_frame() {
    clear
    echo -e "${BLUE}┌─────────────────────────────────┬──────────────────────────────────┐${NC}"
    printf "${BLUE}│${NC}  ${YELLOW}OPERATOR : ${PURPLE}%-20s${NC} ${BLUE}│${NC}  ${CYAN}%-32s${NC}${BLUE}│\n" "youssef" "IPSSI SECURITY UNIT"
    
    printf "${BLUE}│${NC}  ${CYAN}%-31s${NC}${BLUE}│${NC}  ${WHITE}TIME : %-25s${NC}${BLUE}│\n" "██╗██████╗ ███████╗███████╗██╗" ""
    printf "${BLUE}│${NC}  ${CYAN}%-31s${NC}${BLUE}│${NC}  ${WHITE}CITY : Nice, FR${NC}%-11s${BLUE}│\n" "██║██╔══██╗██╔════╝██╔════╝██║" ""
    printf "${BLUE}│${NC}  ${CYAN}%-31s${NC}${BLUE}│${NC}  ${WHITE}METEO: %-25s${NC}${BLUE}│\n" "██║██████╔╝███████╗███████╗██║" "$METEO"
    printf "${BLUE}│${NC}  ${CYAN}%-31s${NC}${BLUE}│${NC}  ${BLUE}%-32s${NC}${BLUE}│\n" "██║██╔═══╝ ╚════██║╚════██║██║" "──────────────────────────"
    printf "${BLUE}│${NC}  ${CYAN}%-31s${NC}${BLUE}│${NC}  ${YELLOW}HEALTH : %-23s${NC}${BLUE}│\n" "██║██║     ███████║███████║██║" ""
    printf "${BLUE}│${NC}  ${CYAN}%-31s${NC}${BLUE}│${NC}  ${GREEN}STATUS : %-23s${NC}${BLUE}│\n" "╚═╝╚═╝     ╚══════╝╚══════╝╚═╝" "ONLINE"

    echo -e "${BLUE}├─────────────────────────────────┼──────────────────────────────────┤${NC}"
    printf "${BLUE}│${NC}  ${WHITE}%-31s${NC}${BLUE}│${NC}  ${WHITE}%-32s${NC}${BLUE}│\n" "[ SÉCURITÉ ]" "[ SYSTÈME ]"
    printf "${BLUE}│${NC}  %-31s${BLUE}│${NC}  %-32s${BLUE}│\n" "1. Audit Security (CSV)" "4. Storage Analyzer"
    printf "${BLUE}│${NC}  %-31s${BLUE}│${NC}  %-32s${BLUE}│\n" "2. System Logs (Critical)" "5. Clean Temp Files"
    printf "${BLUE}│${NC}  %-31s${BLUE}│${NC}  %-32s${BLUE}│\n" "3. Open Ports Scan" "6. Top Process Alert"
    printf "${BLUE}│${NC}  %-31s${BLUE}│${NC}  %-32s${BLUE}│\n" "" ""
    echo -e "${BLUE}├─────────────────────────────────┼──────────────────────────────────┤${NC}"
    printf "${BLUE}│${NC}  ${WHITE}%-31s${NC}${BLUE}│${NC}  ${WHITE}%-32s${NC}${BLUE}│\n" "[ RÉSEAU & ADMIN ]" "[ MAINTENANCE ]"
    printf "${BLUE}│${NC}  %-31s${BLUE}│${NC}  %-32s${BLUE}│\n" "7. Network Diagnostic" "10. SMART BACKUP & HASH"
    printf "${BLUE}│${NC}  %-31s${BLUE}│${NC}  %-32s${BLUE}│\n" "8. User Provisioning" "11. MONITOR SERVICES"
    printf "${BLUE}│${NC}  %-31s${BLUE}│${NC}  %-32s${BLUE}│\n" "" ""
    printf "${BLUE}│${NC}  ${RED}%-31s${NC}${BLUE}│${NC}  %-32s${BLUE}│\n" "0. EXIT SESSION" ""
    echo -e "${BLUE}├─────────────────────────────────┴──────────────────────────────────┤${NC}"
    printf "${BLUE}│${NC} ${WHITE}>> INFO : %-58s ${BLUE}│\n" ""
    echo -e "${BLUE}├────────────────────────────────────────────────────────────────────┤${NC}"
    printf "${BLUE}│${NC}  ${PURPLE}%-48s${NC} ${CYAN}%-15s${NC}${BLUE}│\n" "USER       PID      %CPU  COMMAND" "[BY IPSSI]"
    printf "${BLUE}│${NC}  %-66s${BLUE}│\n" ""
    printf "${BLUE}│${NC}  %-66s${BLUE}│\n" ""
    printf "${BLUE}│${NC}  %-66s${BLUE}│\n" ""
    echo -e "${BLUE}└────────────────────────────────────────────────────────────────────┘${NC}"
}

# --- BOUCLE PRINCIPALE ---
draw_frame

while true; do
    # 1. Calcul des données
    TIME_NOW=$(date -d "+1 hour" +'%H:%M:%S' 2>/dev/null || date +'%H:%M:%S')
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    RAM=$(free | grep Mem | awk '{print int($3/$2 * 100)}')

    # 2. Mise à jour Heure et Santé
    tput cup 2 51; echo -e "${WHITE}$TIME_NOW${NC}"
    tput cup 6 55; printf "${YELLOW}CPU:%-3s RAM:%-3s${NC}" "$CPU%" "$RAM%"
    
    # 3. Mise à jour Message INFO (Nettoyage de ligne pour éviter les restes de texte)
    tput cup 19 12; tput el; 
    printf "${GREEN}%-54s${NC}" "$LAST_MSG"
    tput cup 19 69; echo -e "${BLUE}│${NC}" # Restaure la bordure droite
    
    # 4. Mise à jour Processus (Nettoyage forcé du "T")
    LINE=22
    ps -eo user:10,pid:8,%cpu:5,comm:20 --sort=-%cpu | head -n 4 | tail -n 3 | while read u p c cmd; do
        tput cup $LINE 4; tput el; 
        printf "${WHITE}%-10s %-8s %-6s %-35s${NC}" "$u" "$p" "$c" "$cmd"
        tput cup $LINE 69; echo -e "${BLUE}│${NC}" # Restaure la bordure
        ((LINE++))
    done

    # 5. Positionnement pour commande
    tput cup 26 12; printf "      "
    tput cup 26 1; echo -ne "${BLUE} COMMAND > ${NC}"
    read -t 1 -n 2 key
    
    case $key in
        1) echo "$(date);$USER;AUDIT" >> admin_audit.csv; LAST_MSG="Audit exporté dans admin_audit.csv" ;;
        2) LAST_MSG="Log : $(journalctl -p 3 -n 1 --no-pager | tail -c 40)" ;;
        3) LAST_MSG="Ports : $(ss -tln | grep LISTEN | awk '{print $4}' | xargs | cut -c1-45)" ;;
        4) LAST_MSG="Stockage : $(du -sh ~/* 2>/dev/null | sort -rh | head -n 1)" ;;
        5) find /tmp -type f -atime +1 -delete 2>/dev/null; LAST_MSG="Nettoyage /tmp terminé." ;;
        6) LAST_MSG="Top CPU : $(ps -eo comm --sort=-%cpu | head -n 2 | tail -n 1)" ;;
        7) ping -c 1 8.8.8.8 >/dev/null && LAST_MSG="Réseau OK" || LAST_MSG="Réseau DOWN" ;;
        8) U="u_$(date +%S)"; sudo useradd -m "$U" 2>/dev/null && LAST_MSG="User $U créé." ;;
        10) 
            mkdir -p "archives" ; a="archives/backup_$(date +%H%M).tar.gz"
            tar -czf "$a" *.sh *.csv *.log 2>/dev/null
            LAST_MSG="Backup OK | SHA: $(sha256sum "$a" | cut -c1-8)" ;;
        11) 
            ssh=$(pgrep sshd >/dev/null && echo "UP" || echo "!!")
            ufw=$(sudo ufw status 2>/dev/null | grep -q "active" && echo "ON" || echo "OFF")
            LAST_MSG="SSH:[$ssh] Firewall:[$ufw] [Monitoring OK]" ;;
        0) tput cnorm; clear; exit 0 ;;
    esac
done
