class Update {
    constructor(update){
        this.id = update.id
        this.content = update.content
        this.words = update.words
        this.hours = update.hours
        this.created_at = update.created_at_in_words
        this.previous_link = update.previous_link
        this.next_link = update.next_link
        this.project_id = update.project.id
        this.comments = update.comments
    }

    linkHTML(direction){
        if(this[direction + "_link"]){
            return `<a class="next-prev-link" href="${this[direction + "_link"]}" onClick="return false">${direction.charAt(0).toUpperCase() + direction.slice(1)}</a>`   
        } else {
            return ""
        }
    }

    commentSubmitLink(){
    return `/projects/${this.project_id}/updates/${this.id}/comments`
    }

    statsHTML(){
        let template = ""
        if(this.words){
            template += `<div class="col"><span>${this.words}</span> words added</div>`
        }
        if(this.hours){
            template += `<div class="col"><span>${this.hours}</span> hours worked</div>`
        }
        return template
    }

}


$(document).on('turbolinks:load', function(){
    $("#next-prev-navigation").on('click', '.next-prev-link', function(e){    
        // using the above selector so it works with elements that have been added with ajax
            e.stopImmediatePropagation()
            e.preventDefault()
            $.get(this.href + ".json", function(data){
                
                const newUpdate = new Update(data)
                $(".created-at").text(newUpdate.created_at)
                $(".progress-update-content").text(newUpdate.content)
                $(".next").html(newUpdate.linkHTML("next"))
                $(".previous").html(newUpdate.linkHTML("previous"))
                $(".stats .row").html(newUpdate.statsHTML()) 
                $(".new_comment").attr('action', newUpdate.commentSubmitLink())                

                // 3. Change edit and delete links if they're visible.

                $(".list-unstyled").html("")
                newUpdate.comments.forEach(function(item){
                    const comment = new Comment(item)
                    const commentHTML = comment.format()
                    $(".list-unstyled").append(commentHTML)
                })

            })
    })

})
