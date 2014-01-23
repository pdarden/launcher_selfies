class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :username, null: false
      t.string :profile_image, null: false
      t.string :text, null: false
      t.string :image
      t.string :image_url
      t.datetime :tweet_created_at, null: false

      t.timestamps
    end
  end
end
