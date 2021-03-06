class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :flavor, null: false
      t.float :amount, null: false
    end

    add_index :teas, :flavor, unique: true
  end
end
