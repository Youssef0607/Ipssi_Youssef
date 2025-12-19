ip a
nano syscheck.sh
chmod +x syscheck.sh
./syscheck.sh
nano syscheck.sh
chmod +x syscheck.sh
./syscheck.sh
ls ~ | grep syswatch
cat /home/youssef/syswatch_report_2025-12-18_11-18.txt
df -h | tee -a "$REPORT"
echo "Hôte : $(hostname)" >> "$REPORT"
echo "Hôte : $(hostname)"
nano syscheck.sh
crontab -e
cd ~/syswatch
chmod +x syswatch.sh
./syswatch.sh
./syscheck.sh
cd ~/syscheck
cd ~/syscheck.sh
chmod +x syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
nano gen_html_report
./syscheck.sh
nano gen_html_report
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
curl -s "wttr.in/Paris?format=1"
curl -s "wttr.in/Niec?format=1"
curl -s "wttr.in/Nice?format=1"
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
nano syscheck.sh#!/bin/bash

# --- Couleurs ---
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Masquer le curseur
tput civis
# Nettoyage en quittant (CTRL+C)
trap "tput cnorm; clear; exit" SIGINT

# Initialisation
LAST_MSG="Système prêt. En attente d'une commande..."
WEATHER="Vérification réseau..."

# Fonction météo robuste (Configurée sur Nice)
get_weather() {
    # On tente Nice avec un timeout de 2s pour ne pas bloquer l'heure
    W=$(curl -s --connect-timeout 2 "wttr.in/Nice?format=1" 2>/dev/null)
    if [ $? -eq 0 ] && [ ! -z "$W" ]; then
        echo "$W"
    else
        # Si ça échoue (météo indisponible), on met un message propre
        echo "Nice, FR (Local)" 
    fi
}

# --- DESSIN INITIAL DE L'INTERFACE (FIXE) ---
clear
# 1. Ton nom en haut à gauche
tput cup 0 2; echo -e "${YELLOW}Owner: ${PURPLE}youssef${NC}"

# 2. Le logo IPSSI massif
tput cup 1 2; echo -e "${CYAN}"
cat << "EOF"
  ██╗██████╗ ███████╗███████╗██╗
  ██║██╔══██╗██╔════╝██╔════╝██║
  ██║██████╔╝███████╗███████╗██║
  ██║██╔═══╝ ╚════██║╚════██║██║
  ██║██║     ███████║███████║██║
  ╚═╝╚═╝     ╚══════╝╚══════╝╚═╝
EOF
echo -e "${NC}"

# 3. Barre de séparation
tput cup 8 2; echo -e "${CYAN}==============================================================${NC}"

# 4. Le menu à la verticale (bien aligné en dessous)
tput cup 12 4; echo -e "${WHITE}1)${NC} Alerte IPSSI (Broadcast)"
tput cup 13 4; echo -e "${WHITE}2)${NC} Créer Dossier de Projet"
tput cup 14 4; echo -e "${WHITE}3)${NC} Scanner Réseau Local"
tput cup 15 4; echo -e "${WHITE}4)${NC} Vérifier Espace Disque"
tput cup 16 4; echo -e "${WHITE}5)${NC} Matrix Mode (Animation)"
tput cup 17 4; echo -e "${WHITE}6)${NC} Quitter le Dashboard"

# Premier appel météo
WEATHER=$(get_weather)

while true; do
    # --- MISE À JOUR DES INFOS DYNAMIQUES ---
    
    # HEURE CORRIGÉE (Heure de Paris/Nice)
    CURRENT_TIME=$(TZ='Europe/Paris' date +'%H:%M:%S')
    
    tput cup 3 35; echo -e "${YELLOW}HEURE  :${NC} $CURRENT_TIME  "
    tput cup 4 35; echo -e "${YELLOW}VILLE  :${NC} Nice               "
    tput cup 5 35; echo -e "${YELLOW}METEO  :${NC} $WEATHER             "
    
    # Zone de message d'action (on efface la ligne proprement)
    tput cup 10 2; tput el
    echo -e "${WHITE}ACTION : ${GREEN}$LAST_MSG${NC}"

    # Zone de saisie
    tput cup 19 2; echo -n "👉 Choix [1-6] : "

    # Lecture d'une touche (0.3s pour que l'heure défile bien)
    read -t 0.3 -n 1 key
    
    case $key in
        1)
            LAST_MSG="!!! ALERTE ENVOYÉE PAR YOUSSEF !!!"
            wall "Message urgent de Youssef : La séance est terminée !" 2>/dev/null
            ;;
        2)
            DIR="IPSSI_YOUSSEF_$(date +%Hh%M)"
            mkdir -p ~/"$DIR"
            LAST_MSG="Dossier '$DIR' créé dans votre Home."
            ;;
        3)
            IP_PUB=$(hostname -I | awk '{print $1}')
            LAST_MSG="Scan terminé. Votre IP locale : $IP_PUB"
            ;;
        4)
            DISK=$(df -h / | awk 'NR==2 {print $4}')
            LAST_MSG="Espace libre sur le disque : $DISK"
            ;;
        5)
            LAST_MSG="Chargement du flux Matrix..."
            tput cup 21 2; echo -e "${GREEN}1011001011010101011010110101010110101${NC}"
            sleep 1
            tput cup 21 2; tput el
            ;;
        6)
            tput cnorm; clear
            echo -e "${RED}Déconnexion de la Sentinelle... Au revoir Youssef.${NC}"
            exit 0
            ;;
    esac

    # Rafraîchissement de la météo toutes les 5 minutes (300 cycles de 1s)
    # On le fait quand les secondes sont à 00
    if [[ $(date +%S) == "00" ]]; then
        WEATHER=$(get_weather)
    fi
done
./syscheck.sh
./syscheck.s
nano syscheck.sh
./syscheck.s
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
nano syscheck.sh
./syscheck.sh
sudo ./ton_script.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
ls -lh
xdg-open report_*.html
cat report_*.html
python3 -m http.server 8080
nano syscheck.sh
sudo ./syscheck.sh
nano report_1415.html
nano syscheck.sh
sudo ./syscheck.sh
sudo run_smart_backup
nano run_smart_backup
sudo ./syscheck.sh
nano run_smart_backup
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
nano syscheck.sh
sudo .\syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
sudo ./syscheck.sh
nano syscheck.sh
firefox rapport ipssi.html
xdg-open rapport_ipssi.html
sudo apt install firefox -y
nano syscheck.sh
sudo ./syscheck.sh
