module PunishmentsHelper
  def expires(punishment)
    if punishment.expires_at
      time_ago_in_words(punishment.expires_at) + ' ago'
    else
      'Never'
    end
  end
end