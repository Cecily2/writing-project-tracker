class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :word_goal, :words, :hours, :percent_complete_rounded
  belongs_to :user, serializer: ProjectUserSerializer
  has_many :genres
end
