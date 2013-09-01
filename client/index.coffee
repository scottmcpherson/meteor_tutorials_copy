
Meteor.subscribe 'publicPosts'
Meteor.subscribe 'allPosts'

Deps.autorun ->
	Meteor.subscribe 'comments', Session.get 'currentPostId'





