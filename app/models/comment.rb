class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :subject, presence: true
end
