class PostsController < ApplicationController
  
  before_action:authenticate_user
  
  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @like_count = Like.where(post_id:@post.id).count
  end

  def create
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new(content: params[:content],
                    user_id:session[:user_id])
    
    if @post.save
      flash[:notice]="Posted"
      redirect_to("/posts/index")
    else
      render("posts/index")
    end
  end

  def edit
    @post=Post.find_by(id: params[:id])
  end

  def update
    @post=Post.find_by(id: params[:id])
    @post.content=params[:content]
    
    if @post.save
      flash[:notice]="Edited"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post=Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="Deleted"
    redirect_to("/posts/index")
  end

  def retweet_form
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def retweet_create
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new(content: params[:content],
                    user_id:session[:user_id],
                    origin_name:params[:name],
                    origin_image_name:params[:image_name],
                    origin_content:params[:origin_content])
    if @post.save
      flash[:notice]="Posted"
      redirect_to("/posts/index")
    else
      render("posts/index")
    end
  end

end
