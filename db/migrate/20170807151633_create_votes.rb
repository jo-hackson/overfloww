class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :value
      t.belongs_to :votable, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :votes, [:votable_id, :votable_type]
  end
end

# do not need because references will give both those columns automatically
# t.integer :votable_id
# t.string :votable_type
