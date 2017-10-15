class Project < ApplicationRecord
belongs_to :user
has_many :progress_updates

belongs_to :type
has_many :project_genres
has_many :genres, through: :project_genres

accepts_nested_attributes_for :genres


end
