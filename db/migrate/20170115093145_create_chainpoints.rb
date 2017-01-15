class CreateChainpoints < ActiveRecord::Migration[5.0]
  def change
    create_table :chainpoints do |t|
      t.string :target_hash
      t.string :chainpoint_id
      t.string :merkle_root
      t.string :proof
      t.string :anchors
      t.timestamps
    end
  end
end
