module ApplicationHelper
  def avatar(user, options={})
    image = crafatar_url(user, options)
    image_tag image, :alt => "Avatar", class: 'avatar'
  end

  def crafatar_url(user, options = {})
    options[:size] ||= 60
    "https://crafatar.com/avatars/#{user.uuid || 'notch'}?size=#{options[:size]}&helm"
  end

  def latest_post(topic)
    post = relevant_posts(topic).last
    text = "#{time_ago_in_words(post.created_at)} #{t("ago")}"
    link_to text, forem.forum_topic_path(post.topic.forum, post.topic, :anchor => "post-#{post.id}", pagination_param => topic.last_page)
  end
end
