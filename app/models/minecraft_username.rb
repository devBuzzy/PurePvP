class MinecraftUsername < ActiveRecord::Base
  class << self
    def for_uuid(uuid)
      where(:uuid => uuid).first
    end

    def for_user(username)
      User.where(:uuid => where(:username => username).first.uuid).first
    end
  end
end
