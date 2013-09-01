Meteor.publish "publicPosts", ->
	Posts.find
		live: true
	,
		sort:
			submitted: -1
Meteor.publish "allPosts", ->
	user = Meteor.users.findOne @userId
	if Roles.userIsInRole(user, ["admin"])
		Posts.find()
	

Meteor.publish 'comments', (postId)->
	Comments.find postId: postId


