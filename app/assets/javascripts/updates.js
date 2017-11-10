function Update(update){
    this.id = update.id
    this.content = update.content
    this.words = update.words
    this.hours = update.hours
    this.user = {
        id: update.user.id,
        name: update.user.name,
        avatar: update.user.avatar.thumb.url,
        gender: update.user.gender
    }
    this.project = {
        id: update.project.id,
        title: update.project.title
    }
    this.comments = update.comments
}

Update.prototype.format = function(){
    // DO I WANT TO REPLACE ALL HTML AT ONCE?
    // Or should I have multiple template functions, to update things more selectively?
    return ``   
}

$(document).on('turbolinks:load', function(){
    // SO I'd want to add listeners to 'previous' and 'next' links.
    // GET IT WORKING WITHOUT COMMENTS FIRST.


    $(".next-prev-link").click(function(e){
            e.stopImmediatePropagation()
            e.preventDefault()
            $.get(this.href + ".json", function(data){
                console.log(data)
            })
    })


    // $(".new_comment").on("submit", function(e) {
    //     e.preventDefault()
    //     e.stopImmediatePropagation()        

    //     $.post(this.action, $(this).serialize(), function(comment) {
    //         let newComment = new Comment(comment)
    //         let newCommentHTML = newComment.format()
    //         $(".list-unstyled").append(newCommentHTML)
    //         $("#comment_content").val("")
    //     })
    // })

    // $(".delete-comment").click(function(e) {
    //     e.stopImmediatePropagation()
    //     e.preventDefault()
    //     commentId = this.getAttribute("data-comment-id")

    //     $.ajax({
    //         type: 'DELETE',
    //         beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},   
    //         url: this.href,
    //         success: function(e) {
    //             removeComment(commentId)
    //         }
    //     });
    // })


})
