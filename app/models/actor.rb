class Actor < ActiveRecord::Base
  has_many :rollcall
  has_many :movies, through: :rollcall
end
