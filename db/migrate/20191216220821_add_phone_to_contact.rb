class AddPhoneToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :phone, :string
  end
end
