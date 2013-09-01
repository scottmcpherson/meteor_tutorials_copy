Template.listContent.helpers
	contents: ()->
		Posts.find()

Template.content.events
	'click .delete': (e)->
		e.preventDefault()
		# if confirm "Do you really want to delete this content?"
		Posts.remove @_id
		# else
		# 	false