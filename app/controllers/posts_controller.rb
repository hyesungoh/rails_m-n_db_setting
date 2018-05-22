class PostsController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.all.reverse
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
    temp_post = Post.new
    temp_post.title = params[:post_title]
    temp_post.content = params[:post_content]
    temp_post.user_id = current_user.id
    
    hashtags = params[:hashtags].split(',')
    hashtags.each do |tag|
      hashtag = Hashtag.find_or_create_by(name: tag.delete('#'))
      hashtag.save
      temp_post.hashtags << hashtag
    end
    
    temp_post.save
    
    redirect_to '/'
  end

  def delete
    temp_post = Post.find(params[:post_id])
    temp_post.destroy
    
    redirect_to '/'
  end
end
