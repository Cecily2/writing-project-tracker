module ApplicationHelper

  def show_stat(stat, description)
    if stat != nil
      content_tag :div, class: "col" do
        content_tag(:span, stat) + description
      end
    end
  end

end
