class CreateCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :codes do |t|
      t.string :user_uuid
      t.string :user
      t.text :code

      t.timestamps
    end
  end
end
