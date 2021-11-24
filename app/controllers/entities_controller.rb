class EntitiesController < ApplicationController
  def show
    @group = Group.find(params[:group_id])
    @entity = Entity.find(params[:id])
  end

  def new
    @user = current_user
    @group = Group.find(params[:group_id])
    @entity = Entity.new
  end

  def create
    user = current_user
    group = Group.find(params[:group_id])
    entity = user.entities.new(entity_params)

    if entity.save
      flash[:notice] = 'Entity created correctly'
      group.entities << entity
      redirect_to user_group_path(user.id, group.id)
    else
      flash[:error] = 'Entity not created'
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
