class AddAcceptedAtToMembership < ActiveRecord::Migration[7.1]
  def change
    add_column :memberships, :accepted_at, :datetime
  end
end
