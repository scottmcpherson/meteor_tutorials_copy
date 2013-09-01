Package.describe({
	summary: "Trying out the package system"

});
	
Package.on_use(function(api){
	api.add_files('test.js');
	console.log("package is being called");
	
});
	