require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'If response status was correct' do
    describe 'GET /index' do
      it 'returns http success' do
        get '/users/:user_id/posts'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get '/users/:user_id/posts/:id'
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'If a correct template was rendered' do
    describe 'Render /users/:user_id/posts' do
      it 'should render to index template' do
        get '/users/:user_id/posts'
        expect(response).to render_template(:index)
      end
    end

    describe 'Render /users/:user_id/posts/:id' do
      it 'should render to show template' do
        get '/users/:user_id/posts/:id'
        expect(response).to render_template(:show)
      end
    end
  end

  context 'If the response body includes correct placeholder text' do
    describe 'index placeholder' do
      it 'should include the text Here is a list of posts for a given user' do
        get '/users/:user_id/posts'
        expect(response.body).to include('post list')
      end
    end

    describe 'show placeholder' do
      it 'should include the text Here is a single post for a given user' do
        get '/users/:user_id/posts/:id'
        expect(response.body).to include('post list')
      end
    end
  end
end
