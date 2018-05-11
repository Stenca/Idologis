$(function(){
	$('#addVente').on('submit', function(){

		var type = $('#addVente input').eq(0).val();
		var secteur = $('#addVente input').eq(1).val();
		var surface = $('#addVente input').eq(2).val();
		var chambres = $('#addVente input').eq(3).val();
		var classe_energetique = $('#addVente input').eq(4).val();
		var les_plus = $('#addVente input').eq(5).val();
		var img = $('#addVente input').eq(6).val();
		var prix = $('#addVente input').eq(7).val();
		var token = $('#addVente input').eq(8).val();

		if(type == "" || secteur == "" || surface == ""|| chambres == ""|| classe_energetique == ""|| les_plus == ""|| img == "" || prix == ""){
			$('#error').html('<div class="error"><p>Veuillez compléter tous les champs du formulaire.</p></div>');
		}

		else {
			$.ajax({
					url : host + "ajax/addVente.php",
					type : "POST",
					data : { 
						type: type,
						secteur: secteur,
						surface: surface,
						chambres: chambres,
						classe_energetique: classe_energetique,
						les_plus: les_plus,
						img: img,
						prix: prix,
						token: token
					},
					dataType : "text",
					success : function(data){
						$('#error').html('<div class="success"><p>Le bien a été ajouté avec succès.</p></div>');
					},
					error: function() {
              			alert('La requête n\'a pas abouti.'); 
			}	
		}

		$('#error').show();
		return false;
	});
});





