function Comment(comment){
    this.id = comment.id
    this.content = comment.content
    this.user = {
        name: comment.user.name,
        gender: comment.user.gender,
        id: comment.user.id,
        avatar: comment.user.avatar.thumb.url
    }
}

Comment.prototype.format = function(){
    return `<li class="media">
    <img class="d-flex mr-3 avatar-xs" src="${this.user.avatar}">
    <div class="media-body">
      ${this.content}<br>
      <small class="text-muted">
        <a href="/users/${this.user.id}">${this.user.name}</a>
          - Just now
      </small>
      <br><br>      
    </div>
    </li>`   
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