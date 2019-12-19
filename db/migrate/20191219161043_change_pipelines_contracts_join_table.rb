class ChangePipelinesContractsJoinTable < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :pipelines, :contacts
    create_join_table :pipelines, :deals do |t|
      t.index :pipeline_id
      t.index :deal_id
    end
  end
end
