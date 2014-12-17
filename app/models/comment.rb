class Comment < ActiveRecord::Base
  belongs_to :video
  validates :subject, presence: true
end
