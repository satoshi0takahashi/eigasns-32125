class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]
before_action :authenticate_user!, only: [:mypage, :edit, :update]

def show
  @tweets = Tweet.where(user_id: params[:id]).order('created_at DESC')
end

def mypage
  redirect_to user_path(current_user)
  @tweets = Tweet.find_by(user_id: params[:id])
end

def edit
  unless @user == current_user
    redirect_to user_path(@user)
  end
end

def update
  if current_user.update(user_params)
    redirect_to user_path(current_user)
  else
    redirect_to edit_user_path(current_user)
  end
end

private

  def set_user
    @user = User.find(params[:id])
  end
end