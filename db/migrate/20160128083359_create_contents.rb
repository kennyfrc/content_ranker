class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :link
      t.string :title
      t.integer :total_shares
      t.integer :facebook_shares
      t.integer :google_shares
      t.integer :reddit_shares
      t.integer :linkedin_shares
      t.integer :buffer_shares

      t.timestamps null: false
    end
  end
end
