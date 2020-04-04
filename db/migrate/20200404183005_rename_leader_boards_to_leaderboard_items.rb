class RenameLeaderBoardsToLeaderboardItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :leader_boards, :leaderboard_items
  end
end
