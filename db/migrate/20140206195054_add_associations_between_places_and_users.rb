class AddAssociationsBetweenPlacesAndUsers < ActiveRecord::Migration
  def change
    add_reference :places, :users, index: true
  end
end
