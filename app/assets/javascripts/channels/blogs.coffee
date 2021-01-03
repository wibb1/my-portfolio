jQuery(document).on 'turboliinks:load', ->
  comment = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: 'BlogsChannel'
      blog_id: comments.data('blog.id')
    }
    connected: ->
    disconnected: ->
    recieved: (data) ->
      comments.append data['comment']
    send_comment: (comment, blog_id) ->
      @perfom 'send_comment', comment: comment, blog_id: blog_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    textarea = $this.find('#comment_content')
    trimedTextarea = $.trim(textarea.val())
    if trimedTextarea.length > 1
      App.global_chat.send_comment trimedTextarea,
      comments.data('blog_id')
      textarea.val('')
    e.preventDefault()
    return false