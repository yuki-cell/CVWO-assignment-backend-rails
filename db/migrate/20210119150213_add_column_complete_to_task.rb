class AddColumnCompleteToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :completed, :boolean, default: false, null: false

  end
end
