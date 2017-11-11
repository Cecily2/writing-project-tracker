class ProgressUpdateSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper  
  attributes :id, :content, :words, :hours, :previous_link, :next_link, :created_at_in_words
  # belongs_to :user, serializer: ProgressUpdateUserSerializer
  belongs_to :project, serializer: ProgressUpdateProjectSerializer
  has_many :comments

  def created_at_in_words
    time_ago_in_words(object.created_at) + " ago"
  end

  def previous_link
    if prev_object = object.prev
      "/projects/#{prev_object[:project_id]}/updates/#{prev_object.id}"
    end
  end

  def next_link
    if next_object = object.next
      "/projects/#{next_object[:project_id]}/updates/#{next_object.id}"
    end
  end

end