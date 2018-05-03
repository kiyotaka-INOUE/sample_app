class UsersController < ApplicationController
  before_action :authenticate_user!, :except=>[:show]
  
  # def index
  #   @users = User.all
  # end
  # paginateを用いることでページネーション（ページ送り）が使用できます。
  # やり方としてはindexアクションのallの代わりにpaginateを使用します。
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end
end
