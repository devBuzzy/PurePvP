class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # validates :username, presence: true, length: { maximum: 16 }, uniqueness: true

  has_many :reports, class_name: 'Report', inverse_of: :reporter

  before_save :reset_colors

  serialize :username_history

  def get_username
    return MinecraftUsername.where(:uuid => uuid).first
  end

  def encounters
    encounters = kills + deaths
    encounters.sort_by(:timestamp).reverse
  end

  def kills
    Death.where(:killer_uuid => self.uuid)
  end

  def deaths
    Death.where(:victim_uuid => self.uuid)
  end

  def forem_name
    username
  end

  def forem_email
    email
  end

  def groups
    forem_groups
  end

  def highest_group
    groups.order(:priority).first
  end

  def get_name_color
    group = highest_group
    return '' if !highest_group
    return blank_or_return color ||= group.color
  end

  def get_badge_color
    group = highest_group
    return '' if !highest_group
    blank_or_return badge_color ||= group.badge_color
  end

  def get_badge_text
    group = highest_group
    return '' if !highest_group
    blank_or_return badge_text ||= group.badge_text
  end

  def blank_or_return(field)
    return field.blank? ? nil : field
  end

  def reset_colors
    if badge_text.blank?
      badge_text = nil
    end
    if badge_color.blank?
      badge_color = nil
    end
    if color.blank?
      color = nil
    end
  end
end
