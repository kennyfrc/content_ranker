class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :link
      t.string :title

      t.timestamps null: false
    end
  end
end
