class CreateCopies < ActiveRecord::Migration[8.0]
  def change
    create_table :copies do |t|
      t.string :chinese
      t.string :pinyin

      t.timestamps
    end
  end
end
