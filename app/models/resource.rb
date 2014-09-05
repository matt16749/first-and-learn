class Resource < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :takeaways
  has_many :paths, through: :takeaways
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :title, :description, :url, :user_id, presence: true
end