class CustomerSchedule < ActiveRecord::Base
  belongs_to :customer
  belongs_to :chef
end
