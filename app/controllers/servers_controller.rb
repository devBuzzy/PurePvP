class ServersController < ApplicationController
  def index
    @families = ServerFamily.all.by_priority
  end

  def show
    @server = Server.find(params[:id])
  end
end
