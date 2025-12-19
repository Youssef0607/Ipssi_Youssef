#!/bin/bash
# ==============================================================================
# SCRIPT : SENTINEL IPSSI – SOC CONSOLE V12.2
# FINAL FIX : ONLINE GREEN / GAME 99 / YOUSSEF SIGNATURE
# ==============================================================================
export LANG=fr_FR.UTF-8

# ───── Couleurs ─────
BLUE='\033[0;34m'
CYAN='\033[0;36m'
L_CYAN='\033[1;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
ORANGE='\033[38;5;208m'
RED='\033[0;31m'
WHITE='\033[1;37m'
NC='\033[0m'

tput civis
trap "tput cnorm; clear; exit" SIGINT

# ───── Infos fixes ─────
CITY="Nice"
METEO=$(curl -s "wttr.in/Nice?format=%c%t" 2>/dev/null | sed 's/°//g' | head -c 12)
[ -z "$METEO" ] && METEO="☀️ +16C"
LAST_MSG="Console Sentinel IPSSI prête."

# ───── Demande opérateur ─────
tput cnorm; clear
echo -e "${L_CYAN}======================================${NC}"
echo -e "${L_CYAN}     CONSOLE SENTINEL — IPSSI SOC      ${NC}"
echo -e "${L_CYAN}======================================${NC}"
read -p "Nom de l'opérateur : " OPERATOR
OPERATOR=${OPERATOR:-Youssef}
tput civis

IPSSI_ASCII=(
"██╗██████╗ ███████╗███████╗██╗"
"██║██╔══██╗██╔════╝██╔════╝██║"
"██║██████╔╝███████╗███████╗██║"
"██║██╔═══╝ ╚════██║╚════██║██║"
"██║██║     ███████║███████║██║"
"╚═╝╚═╝     ╚══════╝╚══════╝╚═╝"
)

# ───── JEU DU 99 ─────
play_99() {
    tput cnorm; clear
    local secret=$((RANDOM % 100))
    local guess=-1 tries=0
    echo -e "${YELLOW}=== JEU DU 99 ===${NC}"
    while [ "$guess" -ne "$secret" ]; do
        read -p "Ton choix (0-99) : " guess
        ((tries++))
        if [ "$guess" -lt "$secret" ]; then 
            echo -e "${RED}Plus HAUT !${NC}"
        elif [ "$guess" -gt "$secret" ]; then 
            echo -e "${ORANGE}Plus BAS !${NC}"
        fi
    done
    echo -e "${GREEN}Tu as gagné en $tries coups !${NC}"
    sleep 3; tput civis
}

# ───── DINO RUN ─────
play_dino() {
    tput civis; clear
    local score=0 obs_x=40 dino_up=0
    while true; do
        tput cup 5 0; echo "------------------------------------------"
        ((obs_x--)); [ $obs_x -lt 0 ] && obs_x=40 && ((score++))
        tput cup 3 5
        if [ $dino_up -gt 0 ]; then echo "  "; tput cup 2 5; echo "🦖"; ((dino_up--))
        else echo "🦖"; tput cup 2 5; echo "  "; fi
        tput cup 3 $obs_x; echo "🌵 "
        tput cup 6 0; echo -e "Score: $score  (Appuie sur ENTREE pour sauter)"
        if [ $obs_x -eq 5 ] && [ $dino_up -eq 0 ]; then
            echo -e "${RED} GAME OVER! ${NC}"; sleep 2; break
        fi
        read -t 0.1 -n 1 key
        [ "$key" == "" ] && dino_up=3
    done
    draw_static
}

# ───── INTERFACE PRINCIPALE ─────
draw_static() {
    clear
    echo -e "${BLUE}┌─────────────────────────────────┬──────────────────────────────────┐${NC}"
    printf "${BLUE}│${NC} ${YELLOW}OPERATOR : ${PURPLE}%-22s${NC}${BLUE}│${NC} ${L_CYAN}IPSSI SECURITY UNIT${NC}          ${BLUE}│\n" "$OPERATOR"
    echo -e "${BLUE}│${NC}                                 ${BLUE}│${NC}                                  ${BLUE}│${NC}"
    for i in {0..5}; do
        case $i in
            0) INFO="TIME   : $(date +%H:%M:%S)" ;;
            1) INFO="CITY   : $CITY" ;;
            2) INFO="METEO  : $METEO" ;;
            4) INFO="STATS  : MONITORING LIVE" ;;
            5) INFO="STATUS : OPERATIONAL" ;;
        esac

        if [ $i -eq 3 ]; then
            # Ligne spéciale pour HEALTH avec ONLINE en vert sans décalage
            printf "${BLUE}│${NC} ${CYAN}%-31s${NC}${BLUE}│${NC} HEALTH : ${GREEN}ONLINE${NC}                   ${BLUE}│\n" "${IPSSI_ASCII[$i]}"
        else
            printf "${BLUE}│${NC} ${CYAN}%-31s${NC}${BLUE}│${NC} %-32s ${BLUE}│\n" "${IPSSI_ASCII[$i]}" "$INFO"
        fi
    done
    echo -e "${BLUE}├─────────────────────────────────┼──────────────────────────────────┤${NC}"
    printf "${BLUE}│${NC} ${PURPLE}[ SÉCURITÉ ]${NC}               ${PURPLE}[ SYSTÈME ]${NC}              ${BLUE}│\n"
    printf "${BLUE}│${NC} ${YELLOW}1.${NC} Audit sécurité (CSV)    ${YELLOW}4.${NC} Analyse stockage         ${BLUE}│\n"
    printf "${BLUE}│${NC} ${YELLOW}2.${NC} Logs critiques          ${YELLOW}5.${NC} Nettoyage temporaires    ${BLUE}│\n"
    printf "${BLUE}│${NC} ${YELLOW}3.${NC} Scan ports ouverts       ${YELLOW}6.${NC} Processus actifs         ${BLUE}│\n"
    echo -e "${BLUE}├─────────────────────────────────┼──────────────────────────────────┤${NC}"
    printf "${BLUE}│${NC} ${ORANGE}[ RÉSEAU & ADMIN ]${NC}        ${ORANGE}[ JEUX & BONUS ]${NC}         ${BLUE}│\n"
    printf "${BLUE}│${NC} ${YELLOW}7.${NC} Diagnostic réseau        ${ORANGE}99.${NC} Jeu du 99              ${BLUE}│\n"
    printf "${BLUE}│${NC} ${YELLOW}8.${NC} Création utilisateur     ${ORANGE}DR.${NC} Dino Run (BÊTA)        ${BLUE}│\n"
    printf "${BLUE}│${NC} ${RED}0.${NC} Quitter                                                   ${BLUE}│\n"
    echo -e "${BLUE}├────────────────────────────────────────────────────────────────────┤${NC}"
    printf "${BLUE}│${NC} >> INFO : %-58s ${BLUE}│\n" "$LAST_MSG"
    echo -e "${BLUE}├────────────────────────────────────────────────────────────────────┤${NC}"
    # --- SIGNATURE GAUCHE ---
    printf "${BLUE}│${NC} ${YELLOW}Fait par Youssef${NC}%51s ${BLUE}│\n" ""
    echo -e "${BLUE}└────────────────────────────────────────────────────────────────────┘${NC}"
    echo -ne "${L_CYAN} COMMAND > ${NC}"
}

draw_static
while true; do
    TIME_NOW=$(date +%H:%M:%S)
    CPU=$(top -bn1 | awk '/Cpu/ {print int($2)}')
    RAM=$(free | awk '/Mem/ {print int($3/$2*100)}')
    
    tput cup 3 44; printf "${WHITE}%-8s${NC}" "$TIME_NOW"
    tput cup 7 44; printf "${YELLOW}CPU: %2s%%  RAM: %2s%%${NC}" "$CPU" "$RAM"
    tput cup 20 12; printf "${L_CYAN}%-54s${NC}" "$LAST_MSG"
    
    tput cup 24 11; tput cnorm 
    
    read -t 2 -n 2 key
    
    if [ ! -z "$key" ]; then
        case $key in
            1) LAST_MSG="Audit sécurité généré (CSV)" ;;
            2) LAST_MSG="Log: $(journalctl -p 3 -n 1 --no-pager | tail -c 45)" ;;
            3) LAST_MSG="Ports ouverts : $(ss -tln | wc -l)" ;;
            4) LAST_MSG="Stockage utilisé : $(df -h / | tail -1 | awk '{print $5}')" ;;
            5) LAST_MSG="Nettoyage /tmp terminé" ;;
            6) LAST_MSG="Top process : $(ps -eo comm --sort=-%cpu | sed -n 2p)" ;;
            7) ping -c 1 8.8.8.8 &>/dev/null && LAST_MSG="Réseau OK" || LAST_MSG="Réseau DOWN" ;;
            8) LAST_MSG="Utilisateur $OPERATOR ajouté au SOC" ;;
            99) play_99; draw_static ;;
            DR|dr) play_dino ;;
            0) tput cnorm; clear; exit ;;
            *) LAST_MSG="Commande [$key] inconnue" ;;
        esac
        tput cup 24 11; echo -n "      " 
    fi
    tput civis
done
