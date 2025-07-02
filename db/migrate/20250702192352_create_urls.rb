class CreateUrls < ActiveRecord::Migration[8.0]
  def change
    create_table :urls do |t|
      t.string :original, null: false
      t.string :short, null: false

      t.timestamps
    end
    add_index :urls, :short, unique: true
  end
end
