# frozen_string_literal: true

class CreateHumanTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :flow_kit_human_tasks do |t|
      t.references :workflow, foreign_key: { to_table: :flow_core_workflows }, null: false
      t.references :instance, foreign_key: { to_table: :flow_core_instances }, null: false
      t.references :attached_form, foreign_key: { to_table: :form_kit_forms }

      t.string :status, null: false
      t.references :assignable, polymorphic: true, index: { name: "index_form_kit_human_tasks_assignable" }

      t.datetime :assigned_at
      t.datetime :form_filled_at
      t.datetime :finished_at

      t.string :type

      t.timestamps
    end
  end
end
