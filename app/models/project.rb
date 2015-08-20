class Project < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_many :risks
    has_many :tasks
    has_many :references
end
