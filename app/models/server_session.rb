class ServerSession < ActiveRecord::Base
  has_many :deaths

  def online
  end
end
