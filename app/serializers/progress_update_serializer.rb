class ProgressUpdateSerializer < ActiveModel::Serializer
  attributes :id, :content, :words, :hours
  belongs_to :user, serializer: ProgressUpdateUserSerializer
  belongs_to :project, serializer: ProgressUpdateProjectSerializer
  has_many :comments
end