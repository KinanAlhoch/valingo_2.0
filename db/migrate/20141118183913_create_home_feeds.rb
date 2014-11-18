class CreateHomeFeeds < ActiveRecord::Migration
  def change
    create_table :home_feeds do |t|

      t.text :status
      t.integer :user_id
      t.timestamps
    end
  end
end
