class Tag < ApplicationRecord
  belongs_to :task
  validates_presence_of :task
end
