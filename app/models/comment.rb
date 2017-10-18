class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :progress_update

  validates :content, presence: true
end
