class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name, :status
      t.text :body
      t.references :project
      t.references :user

      t.timestamps
    end
  end
end
