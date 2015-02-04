class HomeController < ApplicationController
  def index
    @announcements = Forem::Category.first.forums.first.topics.limit(3)
  end

  def terms
  end

  def rules
  end
end
