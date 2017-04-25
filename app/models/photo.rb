class Photo < ActiveRecord::Base
  validates :title, presence: true
end
