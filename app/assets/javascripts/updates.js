function Update(update){
    this.id = update.id
    this.content = update.content
    this.words = update.words
    this.hours = update.hours
    this.created_at = update.created_at_in_words
    this.prev_link = update.prev_link
    this.next_link = update.next_link
    
    this.comments = update.comments
}

Update.prototype.nextLinkHTML = function(){
    if(this.next_link){
        return `<a class="next-prev-link" href="${this.next_link}">Next</a>`   
    } else {
        return ""
    }
}

Update.prototype.prevLinkHTML = function(){
    if(this.prev_link){
        return `<a class="next-prev-link" href="${this.prev_link}">Previous</a>`   
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
                $(".next").html(newUpdate.nextLinkHTML())
                $(".prev").html(newUpdate.prevLinkHTML())   
                    
                // STUFF I STILL NEED TO UPDATE:
                // 1. Words and hours.
                // 2. Comments & new comment form.
                // 3. Edit & delete links if they're visible.
            })
    })

})
