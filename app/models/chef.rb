class Chef < ActiveRecord::Base
    has_secure_password
    has_many :chef_schedules
end
