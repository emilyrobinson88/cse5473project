class CreateCommonPasswords < ActiveRecord::Migration[6.0]
  def change
    create_table :common_passwords do |t|
      t.string :password
      t.integer :exposures
    end
  end
end
