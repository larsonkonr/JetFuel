class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :title
      t.string :original_url
      t.string :shortened_url
      t.integer :usage, default: true

      t.timestamps null: false
    end
  end
end
