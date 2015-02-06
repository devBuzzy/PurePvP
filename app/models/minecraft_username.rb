class MinecraftUsername < ActiveRecord::Base
  def for_uuid(uuid)
    where(:uuid => uuid).first ||= User.where(:uuid => uuid).first
  end
end
