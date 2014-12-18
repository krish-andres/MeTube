class Playlist < ActiveRecord::Base
  has_many :playlistvideos, dependent: :destroy
  has_many :videos, through: :playlistvideos
  validates :name, presence: true
end
