Template.editContent.helpers
	currentContent: ()->
		Posts.findOne Session.get 'currentContentId'


Template.editContent.events
	'click .post-nav li': (e)->
		isActive = $(e.currentTarget)
		if not isActive.hasClass('active')
			$('.post-nav li').removeClass('active')
			isActive.addClass('active')
			if isActive.hasClass('post')
				console.log "show post"
				$('div.meta').addClass('hide')
				$('div.post').removeClass('hide')

			else
				$('div.post').addClass('hide')
				$('div.meta').removeClass('hide')
				console.log "show meta"

Template.editContent.rendered = ()->
	winHeight = $(window).height()
	aceHeight = winHeight - 72
	$('#aceEditor').css({height: aceHeight})
	$('.meta').css({height: aceHeight})

	$(window).resize (e)->
		winHeight = $(window).height()
		aceHeight = winHeight - 72
		$('#aceEditor').css({height: aceHeight})
		$('.meta').css({height: aceHeight})


	editor.theme = "twilight"
	editor.syntaxMode = "html"
	editor.parseEnabled = true
	post = Posts.findOne Session.get 'currentContentId'
	editor.insertValue = post.postBody

	
	