require 'rails_helper'

describe PostsController do
  describe 'GET #index' do
    it 'will fetch all posts using contentful api' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'will fetch the post details using contentful api' do
      @posts = ContentfulOps.instance.posts
      get :show, params: { id: @posts.first.id }
      expect(response).to be_successful
    end

    it 'will redirect to root_url if unable to fetch the post with provided id' do
      get :show, params: { id: 'abc' }
      expect(response).should redirect_to '/'
      expect(response).not_to be_successful
    end
  end
end
