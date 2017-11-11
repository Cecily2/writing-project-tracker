function Comment(comment){
    this.id = comment.id
    this.content = comment.content
    this.created_at = comment.created_at_in_words    
    this.user = {
        name: comment.user.name,
        id: comment.user.id,
        avatar: comment.user.avatar.thumb.url
    }
}

Comment.prototype.deleteLink = function(){
    if(this.user.id == $("body").attr("data-userid")){
        return `<a class="delete-comment" data-comment-id="${this.id}" rel="nofollow" data-method="delete" href="${window.location.href}/comments/${this.id}">Delete Comment</a>`
    } else {
        return ""
    }
}   

Comment.prototype.format = function(){
    return `<li class="media" id="comment-${this.id}">
    <img class="d-flex mr-3 avatar-xs" src="${this.user.avatar}">
    <div class="media-body">
      ${this.content}<br>
      <small class="text-muted">
        <a href="/users/${this.user.id}">${this.user.name}</a>
          - ${this.created_at}
          ${this.deleteLink()}
      </small>
      <br><br>      
    </div>
    </li>`   
}

$(document).on('turbolinks:load', function(){
    $(".new_comment").on("submit", function(e) {
        e.preventDefault()
        e.stopImmediatePropagation()        
        // using .ajax instead of .post and including csrf token allows comments to be added after
        // loading a new update with ajax
        $.ajax({
            type: 'POST',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},   
            url: this.action,
            data: {
                comment: {
                   content: $("#comment_content").val()
                }
            },
            success: function(comment) {
                let newComment = new Comment(comment)
                let newCommentHTML = newComment.format()
                $(".list-unstyled").append(newCommentHTML)
                $("#comment_content").val("")
            }
        });

    })

    $(".list-unstyled").on('click', '.delete-comment', function(e){    
        e.stopImmediatePropagation()
        e.preventDefault()
        commentId = this.getAttribute("data-comment-id")

        $.ajax({
            type: 'DELETE',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},   
            url: this.href,
            success: function(e) {
                $("#comment-" + commentId).remove()
            }
        });
    })


})
