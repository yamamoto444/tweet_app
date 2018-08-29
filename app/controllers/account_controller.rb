class AccountController < ApplicationController
  before_action:authenticate_user,{only:[:edit,:destroy]}
  before_action:forbid_login_user,{only:[:login_form,:login,:new,:create]}
  def new
    @user = User.new
  end
  def create
    @user = User.new(name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    image_name: "default_user.jpg")
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/posts/index")
      flash[:notice] = "Completion"
    else
      render("account/new")
    end
  end
  def login_form
    @user = User.new
  end
  def login
      @user = User.find_by(email: params[:email],password: params[:password])
      if @user
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      @error_message = "Please check E-mail or password"
      @email = params[:email]
      @password = params[:password]
      render("account/login_form")
  end
end
def logout
  session[:user_id] = nil
  redirect_to("/")
end
def show
  @user = User.find_by(id: params[:id])
end
def edit_form
  @users = User.new
  @user = User.find_by(id:session[:user_id])
end
def edit
  @user = User.find_by(id:session[:user_id])
  @user.name = params[:name]
  @user.email = params[:email]

  if params[:image]
    @user.image_name = "#{@user.id}.jpg"
    image = params[:image]
    File.binwrite("public/user_images/#{@user.image_name}",image.read)
  end
  
  if @user.save
  redirect_to("/account/#{@user.id}/show")
  flash[:notice] = "Edited"
  else
    render("acount/#{@user.id/edit}")
  end
end
def delete_confirm
    @user = User.find_by(id:session[:user_id])
end
def destroy
  @user = User.find_by(id:session[:user_id])
  @user.destroy
  session[:user_id] = nil
  redirect_to("/")
end
def likes
  @user = User.find_by(id: params[:id])
  @likes = Like.where(user_id:@user.id)
end
end
