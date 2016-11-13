class CreateEntry < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :value
      t.date :date
      t.datetime :created_at
      t.datetime :updated_at
      t.string :description
    end
  end
end
