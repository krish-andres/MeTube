class Playlist < ActiveRecord::Base
  has_many :playlistvideos, dependent: :destroy
  has_many :videos, through: :playlistvideos
  has_many :comments, as: :commentable
  validates :name, presence: true
end
