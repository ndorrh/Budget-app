class CreateContractGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_groups do |t|
      t.integer :contract_id
      t.integer :group_id
      t.timestamps
    end
  end
end
