class AddTypeToTouchpoint < ActiveRecord::Migration[6.0]
  def change
    add_column :touchpoints, :interaction_type, :integer
  end
end
