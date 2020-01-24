class RemoveJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_join_table :posts, :users
  end
end
