class User < ApplicationRecord
    has_many :issues
    belongs_to :project
end
