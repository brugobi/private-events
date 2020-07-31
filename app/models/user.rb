class User < ApplicationRecord
    has_secure_password
    has_many :events, foreing_key: 'creator_id', class_name: 'Event'
end
