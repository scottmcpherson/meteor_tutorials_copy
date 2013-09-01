Session.setDefault 'addedPostId', undefined
Session.setDefault 'fullEditView', true
Session.setDefault 'titleLength', undefined
Session.setDefault 'synopsisLength', undefined

Template.addPost.helpers 
	
	titleLength: ()->
		
		currentPost = Posts.findOne _id: Session.get 'addedPostId'
		if currentPost
			titleLength = currentPost.title.length
			Session.set "titleLength", titleLength
			if titleLength > 0
				newLength = 60 - titleLength

	titleLengthColor: ()->

		titleLength = Session.get "titleLength"
		if titleLength <= 60
			'text-success'
		else
			'text-danger'


Template.addedPost.helpers
	addedPost: ()->
		if not Session.get "addedPostId"
			post = Posts.insert 
				url: "a-new-url"
				title: "A placeholder"
				postBody: "Added Post"
				commentCount: 0
				live: false
			Session.set "addedPostId", post
		else
			addedPost = Posts.findOne Session.get "addedPostId"
			addedPost

	fullEditView: ()->
		Session.equals 'fullEditView', true ? true : false
		


Template.addPost.events
	'keyup input': (e)->
		postId = Session.get "addedPostId"
		target = $(e.currentTarget).attr('name')
		value = $(e.currentTarget).val()
		
		updatePost(postId, target, value)

	'keyup textarea#synopsis': (e)->
		postId = Session.get "addedPostId"
		target = $(e.currentTarget).attr('name')
		value = $(e.currentTarget).val()

		updatePost(postId, target, value)


	'click .take-live': ()->
		postId = Session.get "addedPostId"
		Posts.update _id: postId,
			$set: 
				live: true


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

	'click .full-small button': (e)->
		targ = $(e.currentTarget)
		if not targ.hasClass('active')
			$('.full-small button').removeClass('active')
			if targ.hasClass('small-view')
				Session.set 'fullEditView', false
				targ.addClass('active')
			else
				Session.set 'fullEditView', true
				targ.addClass('active')


Template.addPost.rendered = ()->
	configEditor()
	post = Posts.findOne _id: Session.get "addedPostId"
	setPostValues(post)
	
	editor._getSession().on 'change', (e)->
		pBval = editor.value
		postId = Session.get 'addedPostId'
		Posts.update _id: postId, 
			$set: 
				postBody: editor.value

	# post = Posts.findOne Session.get 'addedPostId'
	# postBody = post.postBody
	# editor.insertValue = postBody
	Prism.highlightAll()





		

		