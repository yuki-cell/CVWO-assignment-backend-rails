class AddSubTasksToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :parent_task, foreign_key: { to_table: :tasks }

  end
end
