class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome Back!"
        redirect_to "/places"
      else
        flash["notice"] = "Nope. Invalid"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Nope. Invalid"
      redirect_to "/login"
    end

  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "So Long, Partner"
    redirect_to "/login"
  end
end
  