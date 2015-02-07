module ApplicationHelper

  def profile_link(user)
    username = user
    is_user = user.class.name == 'User'
    if is_user
      username = user.username
    else
      user_class = MinecraftUser.for_user(user)
      if user_class
        user = user_class
        is_user = true
      end
    end
    link_to username, main_app.profile_path(username), class: 'profile-link', style: "color: #{is_user ? user.get_name_color : ''}"
  end

  def user_badge(user)
    return if user.class.name != 'User'
    group = user.highest_group
    return nil if !group
    content_tag(:span, user.get_badge_text, class: 'badge', style: "color: #{user.get_name_color}; background-color: #{user.get_badge_color}")
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

  def timestamp(time)
    time ? time.strftime("%l:%M %p %B %d, %Y") : ''
  end
end
