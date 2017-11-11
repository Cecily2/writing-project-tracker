class CommentSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper  
  attributes :id, :content, :created_at_in_words
  belongs_to :user, serializer: ProgressUpdateUserSerializer

  def created_at_in_words
    time_ago_in_words(object.created_at) + " ago"
  end
end