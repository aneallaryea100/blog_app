require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'index page' do
    before(:each) do
      visit users_path
      @user = User.all
    end

    it 'show all name for the user' do
      @user.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'show the profile picture of the user' do
      @user.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'show number of post for the user' do
      @user.each do |user|
        expect(page).to have_content(user.posts_counter)
      end
    end

    it 'redirect to user show page when user is clicked' do
      @user.each do |user|
        click_link(user.name)
        expect(page).to have_current_path(user_path(user))
      end
    end
  end
end
