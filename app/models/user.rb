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
  end

  def get_name_color
  end
end
