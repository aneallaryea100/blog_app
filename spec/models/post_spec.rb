require 'rails_helper'
RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Tascha',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'I am a preacher of CHRIST',
      posts_counter: 0
    )
    @post = Post.create(
      title: 'Programming school at Microverse is awesome',
      text: 'Coding is fun',
      comments_counter: 0,
      likes_counter: 1,
      author_id: @user.id
    )
  end
  it '@post created should be valid' do
    expect(@post).to be_valid
  end
  it '@Title must not be blank' do
    @post.title = 'Programming school at Microverse is awesome'
    expect(@post).to be_valid
  end
  it '@title must not exceed 250 characters.' do
    @post.title = 'Coding is fun'
    expect(@post).to be_valid
  end
  it '@post created should be valid' do
    @post.comments_counter = 0
    expect(@post).to be_valid
  end
  it '@LikesCounter must be an integer greater than or equal zero.' do
    @post.likes_counter = 1
    expect(@post).to be_valid
  end
end
