class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  has_many :progress_updates
  has_many :comments
  has_many :commented_updates, as: :progress_updates, through: :comments

  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  enum role: [:normal, :admin, :guest]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end      
  end

  def hours_spent
    self.projects.map {|p| p.hours}.sum
  end 

  def words_written
    self.projects.map {|p| p.words}.sum
  end  

end
