require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'show page' do
    before(:each) do
      @user = User.create(
        name: 'Aneal Laryea',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'The greatest tactician in the world of tech',
        posts_counter: 0
      )

      Post.create(
        author_id: @user.id,
        title: 'User 4',
        text: 'Be the best you can be today',
        comments_counter: 0,
        likes_counter: 0
      )

      @user = User.all
      visit user_path(@user.first)
    end

    it 'should see the user\'s profile picture' do
      expect(page).to have_css("img[src*='#{@user.first.photo}']")
    end

    it 'should see the user\'s name' do
      expect(page).to have_content(@user.first.name)
    end

    it 'should see the number of posts the user has written' do
      expect(page).to have_content(@user.first.posts_counter)
    end

    it 'should see the user\'s bio' do
      expect(page).to have_content(@user.first.bio)
    end

    it 'should see the user\'s first 3 posts' do
      recent_posts = @user.first.most_recent_post
      recent_posts.each do |posts|
        expect(page).to have_content(posts.title)
        expect(page).to have_content(posts.text)
      end
    end

    it 'should see a button that view all user\'s posts' do
      expect(page).to have_link('See all post')
    end

    it 'should redirect to user\'s posts index page when clicking on \'See all posts\'' do
      click_link('See all post')
      expect(page).to have_current_path(user_posts_path(@user.first))
    end
  end
end
