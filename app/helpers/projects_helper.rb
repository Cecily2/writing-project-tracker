module ProjectsHelper
  def text_word_goal(project)
    if project.word_goal
      "Word Goal: #{project.word_goal}"
    end
  end
end
