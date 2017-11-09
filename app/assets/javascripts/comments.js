function Comment(comment){
    this.id = comment.id
    this.content = comment.content
    // TO DO: get username and user avatar info?
}

Comment.prototype.format = function(){


/* <li class="media">
    <img class="d-flex mr-3 avatar-xs" src="<%= comment.user.avatar.thumb.url %>">
    <div class="media-body">
      <%= comment.content %><br>
      <small class="text-muted">
         <%= link_to comment.user.name, user_path(comment.user) %>
          - <%= time_ago_in_words(comment.created_at) %> ago
         <%= delete_comment_link(comment) %>
      </small>
      <br><br>      
    </div>
</li> */

return `<li class="media"><div class="media-body">${this.content}</div></li>`
    
}

$(function(){
    $(".new_comment").on("submit", function(e) {

        $.post(this.action, $(this).serialize(), function(comment) {
            let newComment = new Comment(comment)
            let newCommentHTML = newComment.format()
            $(".list-unstyled").append(newCommentHTML)
            $("#comment_content").val("")
        })

        e.preventDefault()
    })
})