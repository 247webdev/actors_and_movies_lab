class Movie < ActiveRecord::Base
  has_many :rollcalls
  has_many :actors, through: :rollcalls
end
