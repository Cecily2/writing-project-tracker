class Project < ApplicationRecord
  belongs_to :user
  has_many :progress_updates, dependent: :destroy

  has_many :project_genres, dependent: :destroy
  has_many :genres, through: :project_genres

  validates :title, presence: true

  def genres_attributes=(genre_attributes)
    genre_attributes.values.each do |genre_attribute|
      genre = Genre.find_or_create_by(genre_attribute)
      self.genres << genre unless genre_attribute[:name] == ""
    end
  end

  def self.by_genre(genre)
    self.joins(:project_genres).where(:project_genres => {:genre_id => genre})
  end

  def self.reached_goal
    self.where("words > word_goal")
  end

  def highest_word_count
  end

  def most_hours_spent
  end

  def progress_bar?
    self.words && self.word_goal
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

  def full_errors_string
    self.errors.full_messages.join(". ") + "."
  end

end
