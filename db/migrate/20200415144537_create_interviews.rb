class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :expires_at
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
