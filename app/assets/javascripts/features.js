$(function() {
	$('[data-toggle="tooltip"]').tooltip({'placement': 'top'});
	$("#post-content").markdown({
		autofocus:false,
		iconlibrary: "fa",
		fullscreen: { enable: false }
	});
});
