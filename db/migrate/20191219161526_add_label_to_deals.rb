class AddLabelToDeals < ActiveRecord::Migration[6.0]
  def change
    add_column :deals, :label, :integer
  end
end
