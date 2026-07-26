
class SetIdsDefault < ActiveRecord::Migration[8.1]
  def change
    change_column_default :teams, :id, from: nil, to: "gen_random_uuid()"
    change_column_default :managers, :id, from: nil, to: "gen_random_uuid()"
    change_column_default :tournaments, :id, from: nil, to: "gen_random_uuid()"
    change_column_default :matches, :id, from: nil, to: "gen_random_uuid()"
  end
end
