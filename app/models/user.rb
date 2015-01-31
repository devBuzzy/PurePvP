class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { maximum: 16, minimum: 3 }, uniqueness: true

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
    forem_groups.order(:priority).first
  end

  def get_name_color
    color ||= highest_group.color
  end

  def get_badge_color
    badge_color || highest_group.badge_color
  end

  def get_badge_text
    badge_text || highest_group.badge_text
  end
end
