class GroupsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
  end

  def new
    @user = current_user
    group = Group.new
  end
  
  def create
    user = current_user
    group = user.groups.new(group_params)

    if group.save
      flash[:notice] = 'Group created correctly'
      redirect_to user_groups(user.id)
    else
      flash[:error] = 'Group not created'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
