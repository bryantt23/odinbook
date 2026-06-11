class FriendshipsController < ApplicationController
  def create
    friend_id=params[:friend_id].to_i

    if friend_id==current_user.id
      flash[:error]="Cannot follow self"
    elsif current_user.friendships.any? { |friendship| friendship.friend_id==friend_id }
      flash[:error]="Already following"
    else
      @friendship=current_user.friendships.build(friend_id: friend_id)

      if @friendship.save
        flash[:alert]="Added friend."
      else
        flash[:error]="Unable to add friend."
      end
    end
    redirect_to users_path
  end

  def destroy
    @friendship=current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:alert]="Removed friendship."
    redirect_to users_path
  end
end
