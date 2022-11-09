require 'rails_helper'

RSpec.describe Post, type: :feature do
  describe 'show page' do
    before(:each) do
      @user = User.create(
        name: 'Aneal Laryea',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'The real Alchemist',
        posts_counter: 0
      )
      @post1 = Post.create(
        author_id: @user.id,
        title: 'Hello Believers',
        text: 'This is my first post',
        comments_counter: 0,
        likes_counter: 0
      )
      Comment.create(author_id: @user, post: @post1, text: 'This is my first comment')
      @user = User.all
      visit user_post_path(@user.ids, @post1.id)
    end

    it 'I can see the post title ' do
      expect(page).to have_content(@post1.title)
    end

    it 'should see who wrote the post' do
      @user.each do |user|
        expect(user.name).to have_content('Aneal Laryea')
      end
    end

    it 'should see the number of comments a post has' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'should see the number of likes for a post' do
      expect(page).to have_content(@post1.likes_counter)
    end

    it 'should see the user\'s first 3 posts' do
      expect(page).to have_content(@post1.text.first(3))
    end

    it 'should see the username of each commentor.' do
      comments = @post1.comments
      comments.each do |comment|
        expect(comment.author_id).to have_content(comment.user.name)
      end
    end

    it 'should see the comment each commentor left.' do
      comments = @post1.comments
      comments.each do |comment|
        expect(comment.text).to have_content(comment.text)
      end
    end
  end
end
