class HomeController < ApplicationController
  def index
    category = Forem::Category.first
    if category
      return if !category.forums.first
      @announcements = category.forums.first.topics.limit(3)
    end
  end

  def terms
  end

  def rules
  end
end
