Template.viewPost.helpers
	currentPost: ->
		Posts.findOne url: Session.get 'currentPostUrl'

	comments: ->
		Comments.find postUrl: @url, 
Template.viewPost.rendered = () ->
	Prism.highlightAll()
	
