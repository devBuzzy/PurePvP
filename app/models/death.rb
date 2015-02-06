class Death < ActiveRecord::Base
  belongs_to :server_session
  class << self
    def kills_for(uuid)
      where(:killer_uuid => uuid)
    end

    def deaths_for(uuid)
      where(:victim_uuid => uuid)
    end

    def for_gamemode(gamemode)
      where(:gamemode => gamemode)
    end
  end 
end
