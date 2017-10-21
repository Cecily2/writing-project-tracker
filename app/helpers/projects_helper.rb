module ProjectsHelper
  def text_word_goal(project)
    if project.word_goal
      "Word Goal: #{project.word_goal}"
    end
  end

  def project_class(user_page)
    if user_page == true
      "user-project"
    else
      "box"
    end
  end  

end
