class Project < ApplicationRecord
belongs_to :user
has_many :progress_updates

end
