class Video < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :playlistvideos, dependent: :destroy
  has_many :playlists, through: :playlistvideos
  has_many :comments, as: :commentable
  belongs_to :user

  validates :title, presence: true
  validates :youtube_url, presence: true
end
