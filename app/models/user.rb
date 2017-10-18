class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  has_many :progress_updates
  has_many :comments
  has_many :commented_updates, as: :progress_updates, through: :comments
  has_many :user_genres
  has_many :genres, through: :user_genres

  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  enum role: [:normal, :admin, :guest]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.first_name
      if auth.extra.raw_info.gender == "female" || auth.extra.raw_info.gender == "male"
        user.gender = auth.extra.raw_info.gender
      end
      user.password = Devise.friendly_token[0,20]
    end      
  end

  def possessive_pronoun
    if self.gender == "female"
      "her"
    elsif self.gender == "male"
      "his"
    else
      "their"
    end
  end

  def hours_spent
    self.projects.map {|p| p.hours }.compact.sum
  end 

  def words_written
    self.projects.map {|p| p.words}.compact.sum
  end  

end
