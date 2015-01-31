$(function() {
	$('[data-toggle="tooltip"]').tooltip({'placement': 'top', 'container': 'body'});
	$("#post-content").markdown({
		autofocus:false,
		iconlibrary: "fa"
	});
});
