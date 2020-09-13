require 'contentful_ops'
require 'rails_helper'

describe ContentfulOps do
  before { allow_any_instance_of(Logger).to receive(:info) }
  before { allow_any_instance_of(Logger).to receive(:debug) }
  before { allow_any_instance_of(Logger).to receive(:error) }

  context '#initialize' do
    it 'initializes the configurations of the contentful' do
      ContentfulOps.instance.send(:initialize)
      expect(ContentfulOps.instance.client).not_to be_nil
      expect(ContentfulOps.instance.client.space.id).to eq(ENV['SPACE_ID'])
      expect(ContentfulOps.instance.client.configuration[:space]).to eq(ENV['SPACE_ID'])
      expect(ContentfulOps.instance.client.configuration[:access_token]).to eq(ENV['ACCESS_TOKEN'])
    end
  end

  context '#posts' do
    it 'will fetch all posts entries from contentful api' do
      expect(ContentfulOps.instance.posts.length).to be > 0
      expect(ContentfulOps.instance.posts.first.id).not_to be_nil
    end
  end

  context '#find_post(id)' do
    it 'will fetch single post using contentful api' do
      posts = ContentfulOps.instance.posts
      post = ContentfulOps.instance.find_post(posts.first.id)
      expect(post).not_to be_nil
    end

    it 'will return nil if unable to fetch single post using contentful api' do
      post = ContentfulOps.instance.find_post('abc')
      expect(post).to be_nil
    end
  end
end
