<?php
require_once("inc/config.php");
$js = '<script type="text/javascript" src="'.host.'js/ventes.js"></script>';
$pageId = 1;
require_once("inc/header.php");
?>

<div class="content white">
	<h1>Ventes
		<select class="selectpicker" >
			<option style="color: grey" disabled selected>Trier par</option>
			<option id="prixCroissant" value="1">Prix croissant</option>
			<option id="prixDecroissant" value="2">Prix d√©croissant</option>
		</select>
	</h1>

	<h2>D√©couvrez nos ventes ci-dessous</h2>

	<div class="background"></div>

	<div class="col-md-12 col-lg-12" id="accueil">
	  	<table class="table table-bordered">
		    <thead>
		      	<tr>
			        <th>Ref</th>
			        <th>Type</th>
			        <th>Secteur</th>
			        <th>Surface</th>
			        <th>Prix</th>
			        <th>D√©tails</th>
		     	</tr>
		    </thead>
		    <tbody></tbody>
	  	</table>
		
		<p>Ajouter un bien en vente</p>
		<form id="addVente" method="post">
			<select name="type">
			<option value=1>Appartement</option>
			<option value=3>Pavillon</option>
			<option value=2>Maison</option>
			</select>
			<select name="secteur">
			<option value=1>Calais</option>
			<option value=2>Dunkerque</option>
			<option value=8>Paris</option>
			<option value=3>Lille</option>
			<option value=9>Arras</option>
			</select>
			<input type="text" name="surface" placeholder="Surface (en m≤)"/>
			<input type="text" name="prix" placeholder="Prix" />
			<input type="text" name="chambres" placeholder="Chambres" />
			<input type="text" name="classe_energetique" placeholder="Classe ÈnergÈtique" />
			<input type="text" name="les_plus" placeholder="Les Plus" />
			<input type="file" name="img" placeholder="Image" />
			<input type="hidden" name="token" value="<?=$token->make('addAccount')?>" />
			<input type="submit" name="submit" value="Ajouter" />
		</form>

	</div>

</div>

<?php 
require_once("inc/footer.php"); 
?>
