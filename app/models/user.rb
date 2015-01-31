class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { maximum: 16, minimum: 3 }
  

  def forem_name
    username
  end

  def forem_email
    email
  end
end
