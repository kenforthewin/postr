class AddYakIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :yak_id, :integer
  end
end
