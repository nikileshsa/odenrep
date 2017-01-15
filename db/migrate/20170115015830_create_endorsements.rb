class CreateEndorsements < ActiveRecord::Migration[5.0]
  def change
    create_table :endorsements do |t|
      t.integer :endorsee_id
      t.integer :endorser_id
      t.integer :event_id
      t.string :code
      t.string :email
      t.boolean :confirmed, :default => false
      t.timestamps
    end
  end
end
