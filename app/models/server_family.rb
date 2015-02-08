class ServerFamily < ActiveRecord::Base
  class << self
    def by_priority
      order(:priority)
    end
  end
end
