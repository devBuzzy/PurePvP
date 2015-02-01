class StaffController < ApplicationController
  def index
    @groups = Forem::Group.where(:show_on_staff_page => true)
  end
end
