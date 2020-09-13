require 'contentful_ops'

class PostsController < ApplicationController
  def index
    @posts = ContentfulOps.instance.posts
  end

  def show
    @post = ContentfulOps.instance.find_post(params[:id])
    redirect_to root_url unless @post
  end
end
