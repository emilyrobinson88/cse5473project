class CreateIpAddress < ActiveRecord::Migration[6.0]
  def change
    create_table :ip_addresses do |t|
      t.string :ipa
      t.string :password
    end
  end
end
