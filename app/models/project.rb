class Project < ApplicationRecord
  belongs_to :user
  has_many :progress_updates

  belongs_to :type
  has_many :project_genres
  has_many :genres, through: :project_genres

  def genres_attributes=(genre_attributes)
    genre_attributes.values.each do |genre_attribute|
      genre = Genre.find_or_create_by(genre_attribute)
      self.genres << genre
    end
  end

end
