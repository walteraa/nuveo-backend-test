# frozen_string_literal: true

# Workflow Scaffold migration
class CreateWorkflows < ActiveRecord::Migration[6.0]
  def change
    create_table :workflows, id: :uuid do |t|
      t.jsonb :data, null: false, default: '{}'
      t.integer :status, null: false, default: 0
      t.text :steps, null: false, array: true, default: []
      t.timestamps
    end
  end
end
