# Sentinel IPSSI — SOC Console

> Console de supervision et d'audit sécurité en ligne de commande destinée à la surveillance système et à l'analyse basique SOC.

---

## Présentation

**Sentinel IPSSI** est un outil SOC simplifié développé dans un cadre pédagogique.  
Il permet de centraliser plusieurs fonctionnalités de surveillance, d’audit et d’analyse système dans une seule interface en ligne de commande.

Ce projet vise à simuler un environnement de **Security Operations Center (SOC)** et à automatiser des tâches courantes de supervision Linux.

---

## Objectifs pédagogiques

  - Comprendre le fonctionnement des ressources système Linux  
  - Automatiser des tâches d'administration système  
  - Mettre en pratique des notions de cybersécurité  
  - Apprendre la structuration d’un projet Bash  
  - Simuler un outil SOC simplifié  

---

## Fonctionnalités principales

### Supervision système
  - Surveillance CPU  
  - Surveillance mémoire RAM  
  - Surveillance espace disque  
  - Affichage des informations système  

### Analyse et audit
  - Consultation des logs critiques  
  - Génération de rapports d’audit  
  - Export des données au format CSV  

### Réseau
  - Scan et analyse des connexions réseau  
  - Affichage des interfaces actives  

### Modules annexes
  - Mini-jeux intégrés (Dino Run, Jeu du 99)  
  - Outils interactifs  

---

## Stack technique

  - Bash / Shell Script  
  - Environnement Linux  
  - Commandes système natives :  
    - `top`  
    - `free`  
    - `df`  
    - `ps`  
    - `netstat` / `ss`  
    - `awk` / `grep` / `sed`  

---

## Organisation du projet

Le projet est structuré autour de :

  - Scripts principaux de lancement  
  - Modules de supervision  
  - Scripts d’audit et reporting  
  - Outils complémentaires  
  - Fichiers de logs et exports  

---

## Installation

### Prérequis

  - Système Linux (Debian, Ubuntu, Kali recommandé)  
  - Bash installé  
  - Droits d’exécution sur les scripts  

---

### Étapes d’installation

1️⃣ Cloner le dépôt :

```bash
git clone https://github.com/Youssef0607/Ipssi_Youssef.git
cd Ipssi_Youssef
```

2️⃣ Appliquer les permissions :

```bash
chmod +x *.sh
```

3️⃣ Lancer la console :

```bash
./sentinel.sh
```


## Utilisation

Une fois lancé, Sentinel IPSSI permet :

  - De surveiller l’état du système en temps réel

  - D’analyser les logs critiques

  - De générer des rapports d’audit

  - D’accéder aux modules réseau et utilitaires

  - L’interface est interactive et guidée par menu.

## Sécurité

Ce projet est conçu à des fins pédagogiques et de démonstration.
Il ne remplace pas un outil SOC professionnel mais permet de comprendre les mécanismes de base de supervision et d’analyse.

## Auteur

Youssef
Étudiant IPSSI — Cybersécurité / Systèmes & Réseaux

## Année académique

2025 — 2026
