Meteor.Router.add
	'/': 'listPosts'
	'/posts/:url':
		to: 'viewPost'
		and: (url)->
			Session.set 'currentPostUrl', url
	'/bt-admin': 'listContent'
	'/bt-admin/:_id/edit': 
		to: 'addPost'
		and: (id)->
			Session.set 'addedPostId', id
	'/bt-admin/add': 'addPost'
