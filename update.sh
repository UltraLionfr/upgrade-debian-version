#!/bin/bash

# Script de mise à jour de Debian 11 vers Debian 12

echo "Mise à jour de Debian 11 vers Debian 12"

# Mise à jour des paquets existants
echo "Mise à jour des paquets existants..."
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y

# Suppression des paquets obsolètes
echo "Suppression des paquets obsolètes..."
sudo apt autoremove --purge -y

# Sauvegarde des fichiers de configuration
echo "Sauvegarde des fichiers de configuration..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Modification du fichier sources.list
echo "Modification du fichier sources.list pour Debian 12..."
sudo sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list
sudo sed -i 's|/bullseye/|/bookworm/|g' /etc/apt/sources.list

# Mise à jour de la liste des paquets
echo "Mise à jour de la liste des paquets..."
sudo apt update

# Mise à niveau du système vers Debian 12
echo "Mise à niveau du système vers Debian 12..."
sudo apt upgrade -y
sudo apt full-upgrade -y

# Vérification de la version de Debian
echo "Vérification de la version de Debian..."
cat /etc/debian_version

echo "Mise à jour terminée. Redémarrage du système nécessaire."
