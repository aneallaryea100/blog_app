require 'rails_helper'
RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(name: 'natasha', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'Im a rich and wise young lady', posts_counter: 1)
  end
  it '@user created should be valid' do
    expect(@user).to be_valid
  end
  it 'name value should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
  it 'posts_counter must have a numeric value' do
    @user.posts_counter = 'abc'
    expect(@user).to_not be_valid
  end
  it 'post_counter must be >= 0' do
    @user.posts_counter = -1
    expect(@user).to_not be_valid
  end
  it 'has a valid bio' do
    @user.bio = 'nil'
    expect(@user).to_not be_valid
  end
end
