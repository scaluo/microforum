class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :topic
      t.references :user
      t.text :content

      t.timestamps
    end
  end
end
