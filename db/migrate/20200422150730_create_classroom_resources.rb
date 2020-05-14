class CreateClassroomResources < ActiveRecord::Migration[6.0]
  def change
    create_table :classroom_resources, id: :uuid do |t|
      t.references :resource, null: false, foreign_key: true, type: :uuid
<<<<<<< HEAD
      t.references :classroom, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end

    Resource.all.group_by(&:url).each do |url, resources|
      classroom_ids = resources.map(&:classroom_id)
      resources[0].update!(classroom_ids: classroom_ids)
      resources[1..-1].map(&:destroy)
    end

=======

      t.timestamps
    end
  end

  j = 0

  all_resources = Resource.all.group_by(&:url)

  # array of int
  total_count_resources = all_resources.map do |url, resource| resource.count end

  while j < total_count_resources.length
    total_count_resources.each do |nb|

      # out of idea

      if nb > 1
        all_resources.map do |url, resource|
          if i > 1
            # destroy resource
          end
        end
      end
    end

    j += 1
>>>>>>> 7bb90d030ddf28878b1f540c8542bf48628cd0a8
  end

end
