require 'rails_helper'
RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Tascha',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'I am a preacher of CHRIST',
      posts_counter: 0
    )
    @post = Post.create(
      author_id: @user.id
    )
    @like = Like.create(
      author_id: @user.id,
      post_id: 1
    )
  end

  it '@like created should not have user' do
    @like.author = nil
    expect(@like).to_not be_valid
  end
  it '@like created should not have post' do
    @like.post = nil
    expect(@like).to_not be_valid
  end
end
