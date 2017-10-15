require 'pry'
class ProgressUpdate < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments

  def self.add_and_update_project(params, word_format, project)
    update = self.new
    update.project = project
    if word_format == "new"
      update.project.words += params[:words].to_i
      words_added = params[:words].to_i
    else
      update.project.words = params[:words].to_i
      words_added = update.project.words - params[:words].to_i
    end

    update.project.hours += params[:hours].to_f
    update.content = params[:content]
    update.words = words_added
    update.hours = params[:hours].to_f
    update
  end
end
