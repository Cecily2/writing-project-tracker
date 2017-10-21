# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (user has many projects) 
- [x] Include at least one belongs_to relationship (project belongs to user)
- [x] Include at least one has_many through relationship (user has many commented_updates through comments)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (content)
- [x] Include reasonable validations for simple model objects (User, Project, ProgressUpdate, Genre, Comment)
- [x] Include a class level ActiveRecord scope method (Project, self.reached_goal, /projects/reached_goal)
- [x] Include a nested form writing to an associated model using a custom attribute writer (/projects/new, Genre)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (Devise/OmniAuth with Facebook)
- [x] Include nested resource show or index (users/1/updates, projects/1/updates)
- [x] Include nested resource "new" form (projects/1/updates/new)
- [x] Include form display of validation errors (/projects/new, /projects/1/updates/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate