class CreatePipelinesContactsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :pipelines, :contacts do |t|
      t.index :pipeline_id
      t.index :contact_id
    end
  end
end
