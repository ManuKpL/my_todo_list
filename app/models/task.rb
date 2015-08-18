class Task < ActiveRecord::Base
  validates_presence_of :name, :description
  validates :name, length: { minimum: 2 }
  validates :description, length: { minimum: 10 }
end
