class ModifyAssociationsBetweenPlacesAndUsers < ActiveRecord::Migration
  def change
    add_reference :places, :user, index: true
    remove_reference :places, :users, index: true
  end
end
