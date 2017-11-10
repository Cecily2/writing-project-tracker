function Comment(comment){
    this.id = comment.id
    this.content = comment.content
    this.user = {
        name: comment.user.name,
        id: comment.user.id,
        avatar: comment.user.avatar.thumb.url
    }
}

Comment.prototype.format = function(){
    return `<li class="media" id="comment-${this.id}">
    <img class="d-flex mr-3 avatar-xs" src="${this.user.avatar}">
    <div class="media-body">
      ${this.content}<br>
      <small class="text-muted">
        <a href="/users/${this.user.id}">${this.user.name}</a>
          - Just now
          <a class="delete-comment" data-comment-id="${this.id}" rel="nofollow" data-method="delete" href="${window.location.href}/comments/${this.id}" onClick="removeComment(${this.id})">Delete Comment</a>
      </small>
      <br><br>      
    </div>
    </li>`   
}

function removeComment(id){
    $("#comment-" + id).remove()
}

$(document).on('turbolinks:load', function(){

    $(".new_comment").on("submit", function(e) {
        e.preventDefault()
        e.stopImmediatePropagation()        

        $.post(this.action, $(this).serialize(), function(comment) {
            let newComment = new Comment(comment)
            let newCommentHTML = newComment.format()
            $(".list-unstyled").append(newCommentHTML)
            $("#comment_content").val("")
        })
    })

    $(".delete-comment").click(function(e) {
        e.stopImmediatePropagation()
        e.preventDefault()
        commentId = this.getAttribute("data-comment-id")

        $.ajax({
            type: 'DELETE',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},   
            url: this.href,
            success: function(e) {
                removeComment(commentId)
            }
        });
    })


})
