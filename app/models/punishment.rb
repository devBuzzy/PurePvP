class Punishment < ActiveRecord::Base

  def punisher_username
    MinecraftUser.for_uuid(punisher).username
  end

  def punished_username
    MinecraftUser.for_uuid(punished).username
  end

  def get_color
    color = case punishment_type
    when "Warn" then 'green'
    when "Ban" then 'red'
    when "Kick" then 'orange'
    else ''
    end
    return color
  end
end
