class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :user, foreing_key: true, index: true
      t.text      :content

      t.timestamps
    end
  end
end
