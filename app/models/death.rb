class Death < ActiveRecord::Base
  belongs_to :server_session
  class << self
    def kills_for(uuid)
      Death.where(:killer_uuid => uuid)
    end

    def deaths_for(uuid)
      Death.where(:victim_uuid => uuid)
    end
  end 
end
