function Update(update){
    this.id = update.id
    this.content = update.content
    this.words = update.words
    this.hours = update.hours
    this.created_at = update.created_at_in_words
    this.previous_link = update.previous_link
    this.next_link = update.next_link
    
    this.comments = update.comments
}

Update.prototype.LinkHTML = function(direction){
    console.log(this[direction + "_link"])
    if(this[direction + "_link"]){
        return `<a class="next-prev-link" href="${this[direction + "_link"]}">${direction.charAt(0).toUpperCase() + direction.slice(1)}</a>`   
    } else {
        return ""
    }
}

$(document).on('turbolinks:load', function(){

    $(".next-prev-link").click(function(e){
            e.stopImmediatePropagation()
            e.preventDefault()
            $.get(this.href + ".json", function(data){
                let newUpdate = new Update(data)
                $(".created-at").text(newUpdate.created_at)
                $(".progress-update-content").text(newUpdate.content)
                $(".next").html(newUpdate.LinkHTML("next"))
                $(".previous").html(newUpdate.LinkHTML("previous"))   
                    
                // STUFF I STILL NEED TO UPDATE:
                // 1. Words and hours.
                // 2. COMMENTS & new comment form.
                // 3. Edit & delete links if they're visible.
            })
    })

})
