class CreateContractGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_groups do |t|

      t.timestamps
    end
  end
end
