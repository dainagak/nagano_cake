class AddAdminToPublics < ActiveRecord::Migration[5.2]
  def change
    add_column :publics, :admin, :boolean, default: false
  end
end
