module ApplicationHelper

  def profile_link(user)
    link_to user.username, profile_path(user.username), class: 'profile-link'
  end

  def latest_post(topic)
    post = relevant_posts(topic).last
    text = "#{time_ago_in_words(post.created_at)} #{t("ago")}"
    link_to text, forem.forum_topic_path(post.topic.forum, post.topic, :anchor => "post-#{post.id}", pagination_param => topic.last_page)
  end

  def active(tab, options = {})
    active = false
    options[:controller] ||= params[:controller]
    options[:forums] ||= false
    options[:action] ||= nil
    if options[:forums] && options[:controller].start_with?('forem')
      active = true
    elsif 
      active = tab == options[:controller]
      if options[:action]
        active = params[:action] == options[:action]
      end
    end
    return active ? 'active' : ''
  end
end
