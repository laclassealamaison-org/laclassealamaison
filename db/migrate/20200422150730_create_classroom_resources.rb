class CreateClassroomResources < ActiveRecord::Migration[6.0]
  def change
    create_table :classroom_resources, id: :uuid do |t|
      t.references :resource, null: false, foreign_key: true, type: :uuid
      t.references :classroom, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end

    Resource.all.group_by(&:url).each do |url, resources|
      classroom_ids = resources.map(&:classroom_id)
      resources[0].update!(classroom_ids: classroom_ids)
      resources[1..-1].map(&:destroy)
    end

  end

end
