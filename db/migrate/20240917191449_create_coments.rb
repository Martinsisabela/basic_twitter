class CreateComents < ActiveRecord::Migration[7.2]
  def change
    create_table :coments do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
