class AddUserIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :integer 
    #above the first item is table :articles, second column name :user_id, third type :integer (foreign key has to be type integer)
  end
end
