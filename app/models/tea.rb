class Tea < ApplicationRecord
    validates_presence_of :title, :description, :brew_time
    has_many :subscriptions
end
