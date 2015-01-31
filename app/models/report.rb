class Report < ActiveRecord::Base
  belongs_to :reporter, class_name: 'User', inverse_of: :reports
end
