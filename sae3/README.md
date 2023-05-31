# SAE 2.03

## Membres du binôme : MONNEY Romain et SAUVAGEOT Nino

## Enseigant TD : BARRIOS Theo

### Connexion à la VM :

pour se connecter à la VM en tant que 'iut' :

    iut : pour le nom du login
    iutinfo : pour le mot de passe

pour se connecter en root à la VM :

se connecter en tant que 'iut' et faire la commande suivante.

    su -
    mot de passe de iut

### Serveur de base de données MySQL :

pour se connecter à mysql :

    sudo mysql -p
    mot de passe du root 'Azerty01'

## Outil d'administration de bases de données phpMyAdmin :

pour se connecter en tant que admin à phpmyadmin depuis la page de connexion :

    user : admin
    mdp : Azerty01

pour se connecter en tant que mysqltest à phpmyadmin depuis la page de connexion :

    user : mysqltest
    mdp : Azerty01

## Installation du CMS WordPress

pour se connecter en tant que iut à la page wordpress :

Utiliser l'URL :

    https://2a4v2-31uvm6.ad-urca.univ-reims.fr

utiliser les identfiants :

    user : iut
    mdp : iutinfo

## Problème(s) rencontré(s) :

nous avons eu un problème avec mysql :

pour pouvoir lancer 'sudo mysql_secure_installation' nous avons dû modifier le mot de passe du root grâce à un ALTER dans mysql

    sudo mysql
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Azerty01';
    exit

ensuite on a pu lancer la commande 'sudo mysql_secure_installation' et lui donner son mdp

mais à cause de se changement, pour se connecter à mysql, on n'est obligé de changer la commande 'sudo mysql' en :

    sudo mysql -p