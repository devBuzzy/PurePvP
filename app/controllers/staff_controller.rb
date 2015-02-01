class StaffController < ApplicationController
  def index
    @groups = Forem::Group.where(:staff_page => true)
  end
end
