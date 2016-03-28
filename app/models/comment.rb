class Comment < ActiveRecord::Base
  belongs_to :articles
  belongs_to :users
  validates :user_id, presence: true
  validates :article_id, presence: true
  validates :comment, presence: true, length: {minimum: 2, maximum: 300}
end
