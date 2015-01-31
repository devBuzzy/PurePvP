class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { maximum: 16, minimum: 3 }, uniqueness: true

  has_many :reports, class_name: 'Report', inverse_of: :reporter

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
    color || group.color
  end

  def get_badge_color
    group = highest_group
    return '' if !highest_group
    badge_color || group.badge_color
  end

  def get_badge_text
    group = highest_group
    return '' if !highest_group
    badge_text || group.badge_text
  end
end
