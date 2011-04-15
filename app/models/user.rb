class User < ActiveRecord::Base
  has_many :reports
end
