class Project {
    constructor(project){
        this.id = project.id
        this.title = project.title
        this.hours = project.hours
        this.words = project.words
        this.wordGoal = project.word_goal
        this.percent = project.percent_complete_rounded
        this.genres = project.genres
        this.user = project.user
    }

    hoursHTML(){
        if(this.hours){
            return `<div>Hours: ${this.hours}</div>` 
        } else {
            return ""
        }
    }
    goalHTML(){
        if(this.wordGoal){
            return `<div>Word Goal: ${this.wordGoal}</div>`       
        } else {
            return ""
        }
    }
    progressHTML(){
        if(this.wordGoal && this.percent){
            return `<div class="progress">
            <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="${this.percent.toFixed(0)}" aria-valuemin="0" aria-valuemax="100" style="width:${this.percent.toFixed(0)}%"></div>
            </div>
            <span class="text-muted">
            ${this.percent}% complete
            </span>`
        } else {
            return ""
        }
    }
    genresHTML(){
        let genreString = "<div>"
        this.genres.forEach(function(genre){
            genreString += `<span class="badge badge-info">${genre.name}</span> `
        })
        genreString += "</div>"
        return genreString
    }

    projectHTML(){
    return `<div class="col-12 col-md-6"> 
        <div class="box">
            <h3><a href="/projects/${this.id}">${this.title}</a></h3>
            ${this.genresHTML()}
            <div>Created by <a href="/users/${this.user.id}">${this.user.name}</a></div>
            ${this.hoursHTML()}
            ${this.goalHTML()}
            ${this.progressHTML()}
        </div>
    </div>`
    }

}


$(document).on('turbolinks:load', function(){
    $(".filter-form").on('submit', function(e){    
            e.stopImmediatePropagation()
            e.preventDefault()

            $.get(this.action + ".json?" + $(this).serialize(), function(data){
                $(".project-index").html("")
                data.forEach(function(project){
                    let newProject = new Project(project)
                    newProjectHTML = newProject.projectHTML()
                    $(".project-index").append(newProjectHTML)                    
                })
            })

        })

})
