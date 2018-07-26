class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:like_id])
    current_user.like(micropost)
    flash[:success] = "投稿をお気に入りに登録しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.rm_like(micropost)
    flash[:success] = "投稿をお気に入りから解除しました。"
    redirect_back(fallback_location: root_path)
  end
end
