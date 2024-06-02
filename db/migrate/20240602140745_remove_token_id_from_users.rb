class RemoveTokenIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :token_id, :string
  end
end
