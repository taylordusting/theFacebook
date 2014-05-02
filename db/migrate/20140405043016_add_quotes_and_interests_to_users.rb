class AddQuotesAndInterestsToUsers < ActiveRecord::Migration
  def change
    #add_column :users, :quotes, :string
    add_column :users, :interests, :string
  end
end
