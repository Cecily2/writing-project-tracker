# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
    * On progress update show page, users probably can go to "next/previous progress update for this project"
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
    * "Projects" index is updated with AJAX when users filter or sort the projects.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
    * Progress updates have many comments. Projects have many genres.
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
    * Comments can be created (and deleted) without page refresh
- [x] Translate JSON responses into js model objects.
    * Progress Updates, Projects, and Comments have JS model objects.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
    * All model objects have multiple methods

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message