class MinecraftUser < ActiveRecord::Base
  class << self
    def for_uuid(uuid)
      where(:uuid => uuid).first
    end

    def for_user(username)
      User.where(:uuid => where(:username => username).first.uuid).first
    end
  end

  def kills
    Death.where(:killer_uuid => self.uuid)
  end

  def deaths
    Death.where(:victim_uuid => self.uuid)
  end
end
