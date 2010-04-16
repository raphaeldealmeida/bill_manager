class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.string :name
      t.date :due_date
      t.decimal :amount, :precision => 8, :scale => 2
      t.boolean :paid, :default => false
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
