<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>µURL</title>
  <meta name="description" content="Coupe coupe les URLs">
</head>
<body><pre><?php

  // séparer ses identifiants et les protéger, une bonne habitude à prendre
  include "db_connect.php";

  try {

    // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);

    // Requête de sélection dans la table 'url'
    $requete = "SELECT * FROM `url`
                WHERE id = :id";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":id" => "12"
    ));
    $resultat = $prepare->fetchAll();
    print_r([$requete, $resultat]); // debug & vérification


    // Requête d'insertion dans la table 'url'
    $requete = "INSERT INTO `url` (`url`, `shortcut`, `description`)
                VALUES (:url, :shortcut, :description)";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":url" => "jadorelessaucisses.com",
      ":shortcut" => "zgz.yi",
      ":description" => "Un site qui vous parle de saucisses."
    ));
    $resultat = $prepare->rowCount(); // rowCount() pour check combien de row ont été ajouté
    $lastInsertedUrlId = $connexion->lastInsertId(); // on récupère l'id automatiquement créé par SQL, on s'en servira en dessous pour la modification et la suppression
    print_r([$requete, $resultat, $lastInsertedUrlId]); // debug & vérification

    // Requête de modification de la précédente entrée
    $requete = "UPDATE `url`
                SET `url` = :url, `shortcut`= :shortcut, `description` = :description -- Ici on précise ce qu'on souhaite modifier
                WHERE `id` = :id"; // Et là on target avec l'id pour trouver l'élément à modifier
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":id"   => $lastInsertedUrlId,
      ":url" => "jadorelessaucisses.mod.com",
      ":shortcut" => "zgz.mod.yi",
      ":description" => "Un site qui vous parle de saucisses parce que c'est trop bon les saucisses."
    ));
    $resultat = $prepare->rowCount();
    print_r([$requete, $resultat]); // debug & vérification

    // Requête de suppression, ici on supprime l'entrée que l'on vient d'ajouter
    $requete = "DELETE FROM `url`
                WHERE ((`id` = :id));";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array($lastInsertedUrlId)); // on lui passe l'id tout juste créé
    $resultat = $prepare->rowCount();
    print_r([$requete, $resultat, $lastInsertedUrlId]); // debug & vérification

    // Requête d'insertion dans la table 'url' (étape 7)
    $requete = "INSERT INTO `url` (`url`, `shortcut`, `description`)
                VALUES (:url, :shortcut, :description)";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":url" => "https://www.zataz.com/total-energie-direct-obligee-de-stopper-un-jeu-en-ligne-suite-a-une-fuite-de-donnees/",
      ":shortcut" => "ztz7",
      ":description" => "L'entreprise Total Energie Direct avait lancé un jeu en ligne. Le concours a dû être stoppé. Il était possible d'accéder aux données des autres joueurs."
    ));
    $resultat = $prepare->rowCount(); // rowCount() pour check combien de row ont été ajouté
    $lastInsertedUrlId = $connexion->lastInsertId(); // on récupère l'id automatiquement créé par SQL, on s'en servira en dessous pour la modification et la suppression
    print_r([$requete, $resultat, $lastInsertedUrlId]); // debug & vérification

    // Requête d'insertion dans la table 'mc' (hashtag)
    $requete = "INSERT INTO `mc` (`mc`)
                VALUES (:mc);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":mc" => "piratage"
    ));
    $resultat = $prepare->rowCount(); // rowCount() pour check combien de row ont été ajouté
    $lastInsertedMcId = $connexion->lastInsertId(); // on récupère l'id automatiquement créé par SQL
    print_r([$requete, $resultat, $lastInsertedMcId]); // debug & vérification
    
    // Requête d'insertion dans la table associatives 'assoc_mc_url'
    $requete = "INSERT INTO `assoc_mc_url` (`mc_id`, url_id)
                VALUES (:mc_id, :url_id);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":mc_id" => "13",
      ":url_id" => "17"
    ));
    $resultat = $prepare->rowCount(); // rowCount() pour check combien de row ont été ajouté
    $lastInsertedAssocId = $connexion->lastInsertId(); // on récupère l'id automatiquement créé par SQL
    print_r([$requete, $resultat, $lastInsertedAssocId]); // debug & vérification

    // Requête de sélection pour afficher l'url du lien en visant le hashtag 'piratage'
    $requete = "SELECT url -- L'élément qu'on souhaite pull
                FROM assoc_mc_url -- on le pull depuis la table associative grâce aux deux lignes du dessous
                JOIN url on url.id = assoc_mc_url.url_id -- JOIN pour créer la liaison dans la requête entre la table 'url' et la table assoc
                JOIN mc on mc.id = assoc_mc_url.mc_id -- JOIN pour créer la liaison dans la requête entre la table 'mc' et la table assoc
                WHERE mc.mc = :mc;"; // ici on spécifie qu'on ne veut pull que les entrées url associées au mot clé 'piratage'
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":mc" => "piratage"
    ));
    $resultat = $prepare->fetchAll();
    print_r([$requete, $resultat]); // debug & vérification

  } catch (PDOException $e) {

    // en cas d'erreur, on récup et on affiche, grâce à notre try/catch
    exit("❌🙀💀 OOPS :\n" . $e->getMessage());

  }

?></pre></body>
</html>