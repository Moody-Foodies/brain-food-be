class AddTokenIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :token_id, :string
  end
end
