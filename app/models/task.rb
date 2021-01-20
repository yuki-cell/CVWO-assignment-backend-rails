class Task < ApplicationRecord
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags

  belongs_to :parent_task, :class_name => 'Task', optional: true
  has_many :sub_tasks, :class_name => 'Task', :foreign_key => 'parent_task_id', dependent: :destroy
  accepts_nested_attributes_for :sub_tasks

end
