angular.module('Blog').factory('postData', ['$http', ($http) ->

  postData =
    data:
      posts: [{title: 'Loading', contents: ''}]
    isLoaded: false

  console.log("Initialized postData.")


  postData.loadPosts = ->
    if !postData.isLoaded
      $http.get('./posts.json').success( (data) ->
        postData.data.posts = data
        console.log('Successfully loaded posts.')
      ).error( ->
        console.error('Failed to load posts.')
      )


  return postData

])
