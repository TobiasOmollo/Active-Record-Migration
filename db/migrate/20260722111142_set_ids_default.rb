
class SetIdsDefault < ActiveRecord::Migration[8.1]
  def change
    change_column_default :articles, :status, from: nil, to: "draft"
    change_column_default :articles, :status, from: nil, to: "draft"
    change_column_default :articles, :status, from: nil, to: "draft"
    change_column_default :articles, :status, from: nil, to: "draft"
    change_column_default :articles, :status, from: nil, to: "draft"
  end
end
