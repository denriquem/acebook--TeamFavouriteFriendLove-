class WallsController < Clearance::UsersController

  before_action :require_login

  def index
    @posts = Post.all
  end

end