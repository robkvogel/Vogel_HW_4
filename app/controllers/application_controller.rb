class ApplicationController < ActionController::Base
  before_action :current_user

  def set_current_user
    puts "------------------ code before every request ------------------"
    @current_user = User.find_by({ "id" => session["user_id"] })
    @user = User.all
  end

  def current_user
    @current_user
  end


end
