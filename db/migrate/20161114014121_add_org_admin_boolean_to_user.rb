class AddOrgAdminBooleanToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :org_admin, :boolean, default: false
  end
end
