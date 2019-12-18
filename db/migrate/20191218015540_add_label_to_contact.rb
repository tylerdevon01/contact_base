class AddLabelToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :label, :integer
  end
end
