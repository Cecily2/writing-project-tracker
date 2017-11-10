require 'pry'
class ProgressUpdate < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true

  def self.add_and_update_project(params, word_format, project)
    progress_update = self.new
    progress_update.project = project

    if params[:words] != ""
      if word_format == "new"
        words_added = params[:words].to_i
        progress_update.project.words += words_added
      else
        words_added = params[:words].to_i - progress_update.project.words
        progress_update.project.words = params[:words].to_i
      end
      progress_update.words = words_added      
    end

    if params[:hours] != ""
      progress_update.hours = params[:hours].to_f
      progress_update.project.hours += params[:hours].to_f
    end

    progress_update.content = params[:content]
    progress_update
  end

  def full_errors_string
    self.errors.full_messages.join(". ") + "."
  end


  def next
    project.progress_updates.where("id > ?", id).order("id ASC").first
  end

  def prev
    project.progress_updates.where("id < ?", id).order("id DESC").first
  end

end
