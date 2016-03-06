var datepicker = function() {
	$( ".datepicker" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
};

// This is a little fix that helps MDL cooperate with rails' Turbolinks
document.addEventListener('page:change', function() {
  componentHandler.upgradeDom();
  datepicker();
});

$(datepicker());