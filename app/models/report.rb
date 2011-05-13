class Report < ActiveRecord::Base
  has_attached_file :raw_file
  belongs_to :user
  
  before_validation :add_user_id_to_report
  
  def add_user_id_to_report
    self.user_id = User.first.id
  end
end
