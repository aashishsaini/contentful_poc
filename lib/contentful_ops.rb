require 'contentful'
require 'singleton'

# class to perform the contentful operations
class ContentfulOps
  include Singleton

  attr_reader :client

  def initialize
    super
    @client = Contentful::Client.new(
      space: (Rails.env == 'test' ? ENV['SPACE_ID'] : Rails.application.credentials.space_id),
      access_token: (Rails.env == 'test' ? ENV['ACCESS_TOKEN'] : Rails.application.credentials.access_token),
      dynamic_entries: :auto,
      raise_errors: true
    )
  end

  # get all posts from contentful api
  def posts
    posts = @client.entries(content_type: 'post').items
    posts || []
  end

  def find_post(id)
    @client.entry id
  end
end
