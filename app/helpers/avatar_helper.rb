module AvatarHelper
  def avatar(user, options={})
    image = crafatar_url(user, options)
    options = { :profile => true }.merge(options)
    if options[:profile] == false
      image_tag(image, :alt => "Avatar", class: 'avatar')
    else
      link_to image_tag(image, :alt => "Avatar", class: 'avatar'), main_app.profile_path(user.username)
    end
  end

  def crafatar_url(user, options = {})
    options[:size] ||= 60
    "https://crafatar.com/avatars/#{user.uuid}?size=#{options[:size]}&helm"
  end
end