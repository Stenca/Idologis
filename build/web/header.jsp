<!DOCTYPE html>
<html>
	<head>
		<title>AeroClub</title>
		<meta charset="utf8" />
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript" src="js.js"></script>
	</head>
	<body>
		<div id="site">
			<header>
				<div class="header-logo"></div>
				<form class="header-form" action="/aeroclub/connexion" method="POST">
					<input type="text" name="login" placeholder="Pseudonyme" />
					<input type="password" name="password" placeholder="Mot de passe" />
					<input type="submit" value="OK" />
				</form>
			</header>
			<nav>
				<a>Accueil</a>
				<a>Profil</a>
				<a>Réservation</a>
				<div class="nav-right">
					<a>Déconnexion</a>
				</div>
			</nav>
			<div id="content">
                            