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
    if genre != nil && genre != ""
      self.joins(:project_genres).where(:project_genres => {:genre_id => genre})
    else
      self.all
    end
  end

  def self.sort_order(sort_order)
    if sort_order == "words"
      order(words: :desc)
    elsif sort_order == "word_goal"
      order(word_goal: :desc)
    elsif sort_order == "hours"
      order(hours: :desc)
    else
      order(created_at: :desc)      
    end
  end

  def self.reached_goal
    self.where("words > word_goal")
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
