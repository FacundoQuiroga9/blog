class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).limit(5)
  end

  def staff

  end

  def team
    
  end

  def contact

  end
end
