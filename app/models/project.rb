class Project < ApplicationRecord
    has_many :issues
    has_many :users
end
