class CreateCinnabarContent < ActiveRecord::Migration
  def change
    create_table :cinnabar_contents do |t|
      t.string :name
      t.text :content
      t.timestamps
    end

    add_index :cinnabar_contents, :name, unique: true
  end
end
