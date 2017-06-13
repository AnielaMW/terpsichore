require 'json'

class DanceDevSeeder

  def self.seed!
    dance_list = JSON.parse(IO.read('db/seeders/dance_data/header.json'))

    dance_list["header"].each do |d_params|

      dance_level = DanceLevel.find_or_initialize_by(name: d_params["level"])
      unless d_params["level"] == "" || d_params["level"] == nil
        dance_level.update_attributes!(name: d_params["level"], description: "must change")
      end


      formation = Formation.find_or_initialize_by(name: d_params["formation"])
      unless d_params["formation"] == "" || d_params["formation"] == nil
        formation.update_attributes!(name: d_params["formation"], description: "must change")
      end

      key = Key.find_or_initialize_by(name: d_params["key"])
      unless d_params["key"] == "" || d_params["key"] == nil
        key.update_attributes!(name: d_params["key"])
      end

      meter = Meter.find_or_initialize_by(name: d_params["meter"])
      unless d_params["meter"] == "" || d_params["meter"] == nil
        meter.update_attributes!(name: d_params["meter"])
      end

      mood = Mood.find_or_initialize_by(name: d_params["mood"])
      unless d_params["mood"] == "" || d_params["mood"] == nil
        mood.update_attributes!(name: d_params["mood"])
      end

      tempo = Tempo.find_or_initialize_by(name: d_params["tempo"])
      unless d_params["tempo"] == "" || d_params["tempo"] == nil
        tempo.update_attributes!(name: d_params["tempo"], description: "must change")
      end

      user_id = 3

      dance = Dance.find_or_initialize_by(title: d_params["title"])

      dance.title = d_params["title"]
      dance.choreographer = d_params["choreographer"]
      dance.dance_level = dance_level
      dance.formation = formation
      dance.key = key
      dance.meter = meter
      # dance.mood = mood
      dance.tempo = tempo
      dance.user_id = user_id

      dance.save
    end
  end
end
