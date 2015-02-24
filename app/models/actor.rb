class Actor < ActiveRecord::Base
  has_many :rollcalls
  has_many :movies, through: :rollcalls
end
