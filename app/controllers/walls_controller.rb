class WallsController < Clearance::UsersController

  before_action :require_login

  def index
    @posts = Post.all
    @user = User.find(params[:user_id]) if params[:user_id] != nil
    @current_user = current_user
  end

end
