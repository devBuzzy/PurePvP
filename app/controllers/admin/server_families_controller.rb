class Admin::ServerFamiliesController < ApplicationController
  before_filter :set_family, :only => [:show, :edit, :destroy, :update]

  def index
    @families = ServerFamily.all.by_priority
  end

  def show
  end

  def edit
  end

  def destroy
    @family.destroy
    flash[:notice] = 'Successfully deleted a server family'
    redirect_to admin_server_families_path
  end

  def create
    @family = ServerFamily.new(family_params)
    if @family.save
      flash[:notice] = 'Successfully created a new server family.'
      redirect_to [:admin, @family]
    else
      flash[:alert] = 'Unable to save this server family.'
      render 'edit'
    end
  end

  def update
    if @family.update_attributes(family_params)
      flash[:notice] = 'Successfully updated server family'
      redirect_to [:admin, @family]
    else
      flash[:alert] = 'Unable to save server changes'
      render :edit
    end
  end

  def new
    @family = ServerFamily.new
  end

  private
  def set_family
    @family = ServerFamily.find(params[:id])
  end

  def family_params
    params.require(:server_family).permit(:gamemode, :priority, :display)
  end
end
