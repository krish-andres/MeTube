class Video < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :youtube_url, presence: true
end
