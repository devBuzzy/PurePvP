class StatsController < ApplicationController
  def index
    @users = MinecraftUser.all.page(params[:page]).per(20)

  end
end
