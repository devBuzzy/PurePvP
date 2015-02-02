module ApplicationHelper

  def profile_link(user)
    link_to user.username, main_app.profile_path(user.username), class: 'profile-link', style: "color: #{user.get_name_color}"
  end

  def user_badge(user)
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
end
