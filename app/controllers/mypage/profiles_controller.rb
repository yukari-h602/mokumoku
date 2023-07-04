# frozen_string_literal: true

class Mypage::ProfilesController < Mypage::BaseController
  before_action :set_user, only: %i[show edit update]
  def show
  end

  def edit; end

  def update
    if @user.update(profile_params)
      redirect_to mypage_profile_path, success: 'プロフィールを更新しました'
    else
      flash.now[:danger] = '更新できませんでした'
      render :show
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def profile_params
    params.require(:user).permit(:name, :avatar, :email, :profile, :hobby)
  end
end
