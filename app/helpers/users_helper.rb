module UsersHelper
  def about_user(user)
    if user.about
      content_tag(:p, user.about, class: "about-user")
    end
  end

  def possessive_pronoun(user)
    if user.gender == "female"
      "her"
    elsif user.gender == "male"
      "his"
    else
      "their"
    end
  end

  def genres_h3(user)
    if user.genres
      content_tag(:h3, "#{user.name}'s genres")
    end
  end

  def edit_profile_link(user)
    link_to "Edit Proflie", "/users/edit", class: "btn btn-sm btn-primary" if user_signed_in? && current_user == user 
  end

  def add_project_link(user)
    link_to "Add New Project", "/projects/new", class: "btn btn-sm btn-primary" if user_signed_in? && current_user == user
  end

end