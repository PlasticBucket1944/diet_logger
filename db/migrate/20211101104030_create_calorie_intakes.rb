class CreateCalorieIntakes < ActiveRecord::Migration[6.0]
  def change
    create_table :calorie_intakes do |t|
      # t.integer :user_name, null: false, limit:12,
      t.references :user, foreign_key: true, null: false, limit:12, comment: "ユーザーID"
      t.string :name, null: false, limit:40, comment: "摂取物名"
      t.date :date, null: false, index: true, comment: "摂取日"
      t.integer :amount, null: false, limit:6, comment: "摂取カロリー量"
      t.timestamps
    end
  end
end
