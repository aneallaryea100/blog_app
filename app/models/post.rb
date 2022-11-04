class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :updates_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def updates_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  def all_comments
    comments.all
  end
end
