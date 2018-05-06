class UsersController < ApplicationController
  before_action :authenticate_user!, :except=>[:show]
  # before_action :admin_user,     only: :destroy    # 管理者以外のアクセスを制限するbefore_action
  
  # paginateを用いることでページネーション（ページ送り）が使用できます。
  # やり方としてはindexアクションのallの代わりにpaginateを使用します。
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
  def show
    @user = User.find(params[:id])
    # @micropostsインスタンス変数をユーザーshowアクションに追加する
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  # 管理者以外のアクセスを制限するbefore_action
  private
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
