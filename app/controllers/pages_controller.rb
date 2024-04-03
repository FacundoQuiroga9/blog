class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).limit(5)
  end
end
