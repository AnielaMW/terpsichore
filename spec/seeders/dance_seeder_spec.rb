require "rails_helper"
require_relative "../../db/seeders/dances_seeder"

RSpec.describe DanceDevSeeder do
  it "doesn't create duplicate records on multiple runs" do
    DanceDevSeeder.seed!
    
    initial_dance_count = Dance.count
    initial_dl_count = DanceLevel.count
    initial_f_count = Formation.count
    initial_k_count = Key.count
    initial_met_count = Meter.count
    initial_mood_count = Mood.count
    initial_t_count = Tempo.count

    DanceDevSeeder.seed!

    expect(Dance.count).to eq(initial_dance_count)
    expect(DanceLevel.count).to eq(initial_dl_count)
    expect(Formation.count).to eq(initial_f_count)
    expect(Key.count).to eq(initial_k_count)
    expect(Meter.count).to eq(initial_met_count)
    expect(Mood.count).to eq(initial_mood_count)
    expect(Tempo.count).to eq(initial_t_count)
  end
end
