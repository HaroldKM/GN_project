class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profil]

  def index
    # user dashboard - feed

    followers_ids= Follower.where(follower_id: current_account.id).map(&:following_id)
    followers_ids << current_account.id

    @posts= Post.includes(:account).where(account_id: followers_ids).active
    @comment=Comment.new

    following_ids= Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id

    @follower_suggestions = Account.where.not(id: following_ids)
  end

  def profil
    @posts = @account.posts.active
 end

  def follow_account
    follower_id = params[:follow_id]
    if Follower.create!(follower_id: current_account.id, following_id: follower_id)
      flash[:success]= "Now following user"
    else
      flash[:danger]= "Unable to follow user"
    end
    redirect_to dashboard_path

  end


private

  def set_account
    @account=Account.find_by_username(params[:username])
  end

end
