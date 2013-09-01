@updatePost = ( id, prop, val )->
	
	if prop == "title"
		Posts.update _id: id,
			$set: 
				title: val

	if prop == "synopsis"
		Posts.update _id: id,
			$set: 
				synopsis: val
	
	if prop == "url"
		Posts.update _id: id,
			$set: 
				url: val

	if prop == "imageUrl"
		Posts.update _id: id,
			$set: 
				imageUrl: val

	if prop == "videoUrl"
		Posts.update _id: id,
			$set: 
				videoUrl: val




