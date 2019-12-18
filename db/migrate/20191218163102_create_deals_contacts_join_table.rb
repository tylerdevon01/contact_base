class CreateDealsContactsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :deals, :contacts do |t|
      t.index :deal_id
      t.index :contact_id
    end
  end
end
