class HomeController < ApplicationController
  def index
    category = Forem::Category.first
    if category
      forum = category.forums.first
      if forum
        return @announcements = forum.topics.limit(3)
      end
    end
    return []
  end

  def terms
  end

  def rules
  end
end
