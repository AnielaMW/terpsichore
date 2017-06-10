require "rails_helper"
require_relative "../../db/seeders/dance_directions_seeder"

RSpec.describe DirectionDevSeeder do
  it "doesn't create duplicate records on multiple runs" do
    DirectionDevSeeder.seed!
    initial_count = DanceDirection.count
    DirectionDevSeeder.seed!
    expect(DanceDirection.count).to eq(initial_count)
  end
end
