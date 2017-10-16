class Project < ApplicationRecord
  belongs_to :user
  has_many :progress_updates, dependent: :destroy

  belongs_to :type
  has_many :project_genres, dependent: :destroy
  has_many :genres, through: :project_genres

  def genres_attributes=(genre_attributes)
    genre_attributes.values.each do |genre_attribute|
      genre = Genre.find_or_create_by(genre_attribute)
      self.genres << genre
    end
  end

  def percent_complete
    self.words.to_f / self.word_goal.to_f * 100
  end

  def percent_complete_rounded
    percent_complete.round(1)
  end

  def percent_complete_integer
    percent_complete.round(0)    
  end

end
