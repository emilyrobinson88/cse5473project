class AddCountToPasswords < ActiveRecord::Migration[6.0]
  def change
    add_column :passwords, :count, :integer
  end
end
