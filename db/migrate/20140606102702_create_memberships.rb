class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :member, index: true
      t.references :project, index: true
      t.string :invite_key

      t.timestamps
    end
  end
end
