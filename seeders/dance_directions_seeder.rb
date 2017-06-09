require 'json'

class DirectionDevSeeder

  def self.seed!
    # dd_list = JSON.parse(IO.read('db/seeders/dance_data/instruction.json'))
    #
    # dd_list["instruction"].each do |dd_params|
    #
    #   dance = Dance.find_by(id: dd_params["index"])
    #
    #   d_direction = DanceDirection.find_or_initialize_by(dance_id: dd_params["index"], sequence: dd_params["sequence"])
    #
    #   d_direction.dance = dance
    #   d_direction.sequence = dd_params["sequence"]
    #   d_direction.mark = dd_params["mark"]
    #   d_direction.measure = dd_params["measure"]
    #   d_direction.direction = dd_params["note"]
    #   d_direction.position = dd_params["layout"]
    #
    #   d_direction.save
    # end
  end
end
