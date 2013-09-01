@configEditor = ()->
	editor.parseEnabled = true
	editor.theme = "twilight"
	editor.syntaxMode = "html"
	aceHeight = $(window).height()
	$('#aceEditor').css({height: aceHeight})
	$('div.meta').css({height: aceHeight})

	$(window).resize (e)->
		winHeight = $(window).height()
		aceHeight = winHeight - 72
		$('#aceEditor').css({height: aceHeight})
		$('div.meta').css({height: aceHeight})

@setPostValues = (post)->
	$('#title').val post.title
	$('#synopsis').val post.synopsis
	$('#url').val post.url
	$('#imageUrl').val post.imageUrl
	$('#videoUrl').val videoUrl
	editor.insertValue = post.postBody



