require "rails_helper"
require_relative "../../db/seeders/user_seeder"

RSpec.describe UserDevSeeder do
  it "doesn't create duplicate records on multiple runs" do
    UserDevSeeder.seed!
    initial_count = User.count
    UserDevSeeder.seed!
    expect(User.count).to eq(initial_count)
  end
end
