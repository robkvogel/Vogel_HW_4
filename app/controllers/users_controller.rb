class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if User.find_by({ "email" => params["email"] }) == nil
    @user = User.new
    #Changed first and last name to username
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "login"
    else
      flash["notice"] = "Email already in use."
      redirect_to "/users/new"
    end
  end
end
