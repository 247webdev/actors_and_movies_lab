class Movie < ActiveRecord::Base
  has_many :rollcall
  has_many :actors, through: :rollcall
end
