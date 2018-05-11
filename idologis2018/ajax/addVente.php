<?php
session_start();

require_once("../inc/token.php");
$token = new token();

require_once('../inc/config.php');
require_once("../inc/db.php"); 

if($_SESSION['logged'] !== true) {
	header("HTTP/1.0 404 Not Found");
	include('404.php');
	die();
} 
else {
	if(isset($_POST['type']) && isset($_POST['secteur'])&& isset($_POST['surface'])&& isset($_POST['chambres'])&& isset($_POST['classe_energetique'])&& isset($_POST['les_plus'])&& isset($_POST['img'])&& isset($_POST['prix']) && isset($_POST['token']) && $token->verify('addVente', $_POST['token']) === true) {
		$type = $_POST['type'];
		$secteur = $_POST['secteur'];
		$surface = $_POST['surface'];
		$classe_energetique = $_POST['classe_energetique'];
		$chambres = $_POST['chambres'];
		$les_plus = $_POST['les_plus'];
		$img = $_POST['img'];
		$prix = $_POST['prix'];

		$sql = "INSERT INTO vente (id_type, id_secteur, surface, chambres, classe_energetique, les_plus, prix, img) VALUES ($type, $secteur, $surface, $chambres, $classe_energetique,$les_plus, $prix, $img)";

		$stmt = $pdo->prepare($sql);
		$stmt->execute($sql);
	}
}

?>