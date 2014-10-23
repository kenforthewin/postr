class AddUserIdentifierToYaks < ActiveRecord::Migration
  def change
    add_column :yaks, :user_id, :integer
  end
end
