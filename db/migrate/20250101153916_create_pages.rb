class CreatePages < ActiveRecord::Migration[7.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :english_name
      t.string :slug
      t.string :english_slug
      t.integer :position, default: 1

      t.timestamps
    end
    add_index :pages, :name, unique: true
    add_index :pages, :english_name, unique: true
    add_index :pages, :slug, unique: true
    add_index :pages, :english_slug, unique: true
  end
end
