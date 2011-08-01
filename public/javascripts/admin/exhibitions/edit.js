$(document).ready(function(e){
  $("#img_uploader").pluploadQueue({
		// General settings
		runtimes : 'gears,flash,html5',
		url : '/pictures.json',
		max_file_size : '100mb',
		unique_names : true,


		// Specify what files to browse for
		filters : [
			{title : "Image files", extensions : "jpg,gif,png"}
		],

		// Flash settings
		flash_swf_url : '/javascripts/plupload/plupload.flash.swf',

	});
	
	$("#pdf_uploader").pluploadQueue({
		// General settings
		runtimes : 'gears,flash,html5',
		url : '/pdfs.json',
		max_file_size : '100mb',
		chunk_size : '1mb',
		unique_names : true,


		// Specify what files to browse for
		filters : [
			{title : "PDF Files", extensions : "pdf"}
		],

		// Flash settings
		flash_swf_url : '/javascripts/plupload/plupload.flash.swf',

	});
	
	
});