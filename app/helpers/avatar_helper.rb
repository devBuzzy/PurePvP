module AvatarHelper
  def avatar(user, options={})
    image = crafatar_url(user, options)
    image_tag image, :alt => "Avatar", class: 'avatar'
  end

  def crafatar_url(user, options = {})
    options[:size] ||= 60
    "https://crafatar.com/avatars/#{user.uuid || 'notch'}?size=#{options[:size]}&helm"
  end
end