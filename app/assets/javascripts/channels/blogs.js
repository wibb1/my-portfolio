(function() {
  jQuery(document).on('turbolinks:load', function() {
    var comments;
    comments = $('#comments');
    if (comments.length > 0) {
      App.global_chat = App.cable.subscriptions.create({
        channel: "BlogsChannel",
        blog_id: comments.data('blog-id')
      }, {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
          return comments.prepend(data['comment']);
        },
        send_comment: function(comment, blog_id) {
          return this.perform('send_comment', {
            comment: comment,
            blog_id: blog_id
          });
        }
      });
    }
    $('.btn').mouseup(function(e) {
      $(this).blur();
      e.preventDefault();
      return false;
    });
    return $('#new_comment').submit(function(e) {
      var $this, textarea, trimedTextarea;
      $this = $(this);
      textarea = $this.find('#comment_content');
      trimedTextarea = $.trim(textarea.val());
      if (trimedTextarea.length > 1) {
        App.global_chat.send_comment(trimedTextarea, comments.data('blog-id'));
        textarea.val('');
      }
      e.preventDefault();
      return false;
    });
  });

}).call(this);
