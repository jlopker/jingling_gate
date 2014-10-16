class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
