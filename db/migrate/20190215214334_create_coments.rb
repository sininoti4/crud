class CreateComents < ActiveRecord::Migration[5.2]
  def change
    create_table :coments do |t|
      t.references :sin, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
