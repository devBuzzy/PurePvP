module StatsHelper
  def kd_for(kills, deaths)
    if deaths == 0
      return 'N/A'
    else
      return kills / deaths
    end
  end
end
