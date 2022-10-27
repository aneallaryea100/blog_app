class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  def updates_like_counter
    post.increment!(:likes_counter)
  end
end
