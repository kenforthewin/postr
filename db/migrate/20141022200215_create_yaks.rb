class CreateYaks < ActiveRecord::Migration
  def change
    create_table :yaks do |t|
      t.integer :score
      t.string :body

      t.timestamps
    end
  end
end
