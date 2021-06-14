class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :content
      t.string :category
      t.integer :numPage
      t.integer :raiting

      t.timestamps
    end
  end
end
