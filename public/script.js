$(document).ready(function () {
	$("#submitguess").submit(function(){
		$.get("/", $(this).serialize(), function(html){
			$("body").html(html)
		}, "html")
		return false
	})
})