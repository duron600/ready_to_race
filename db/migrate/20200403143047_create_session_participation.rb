class CreateSessionParticipation < ActiveRecord::Migration[6.0]
  def change
    create_table :session_participations do |t|
      t.bigint :client_connection_id
      t.bigint :racing_session_id

      t.timestamps
    end

    add_index :session_participations, [:racing_session_id, :client_connection_id], :name => :index_session_connection
    add_index :session_participations, :client_connection_id
  end
end
