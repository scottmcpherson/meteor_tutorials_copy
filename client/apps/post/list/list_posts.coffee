Session.setDefault 'isGrid', true
Session.setDefault 'commentsPostUrl', undefined

Template.listPosts.helpers

	posts: ->
		Posts.find live: true
			
	gridActive: ->
		(if Session.equals("isGrid", true) then 'active' else '')
		

	listActive: ->
		(if Session.equals("isGrid", false) then 'active' else '')
		

	isGridOrList: ->
		user = Meteor.user()
		Session.set "isGrid", false if user and user.profile.layout is "list"
		(if Session.equals("isGrid", false) then 'list' else '')
		

Template.listPosts.events

	'click .btn-grid': (e)->
		e.preventDefault()
		console.log "button grid clicked"
		gridBtn = $(e.currentTarget)
		if not gridBtn.hasClass('active')
			Meteor.call 'changeLayout', 'grid', (error, id)->
				Session.set 'isGrid', true if not error

	'click .btn-list': (e)->
		e.preventDefault()
		console.log "button list clicked"
		listBtn = $(e.currentTarget)
		if not listBtn.hasClass('active')
			Meteor.call 'changeLayout', 'list', (error,id)->
				Session.set 'isGrid', false if not error

Template.post.helpers

	colClass: ->
		(if Session.equals("isGrid", true) then "col-lg-3" else "col-lg-12")
		

Template.post.events 

	'click .comments': (e)->
		e.preventDefault()
		# $('#myModal').modal()
		Session.set "commentsPostUrl", @url
		Session.set "modalVisible", true
		# console.log "this url: ", @url


			

		
		



		
		
			


