require 'rails_helper'

RSpec.describe Dance, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:dance_level).optional }
  it { should belong_to(:formation) }
  it { should belong_to(:key).optional }
  it { should belong_to(:meter) }
  it { should belong_to(:tempo).optional }
  it { should have_many(:dance_comments) }
  it { should have_many(:dance_directions) }
  # it { should have_many(:moods) }

  it { should validate_presence_of(:title) }
  it { should_not have_valid(:title).when('') }

  it { should validate_presence_of(:dance_level_id) }
  it { should_not have_valid(:dance_level_id).when('') }

  it { should validate_presence_of(:formation_id) }
  it { should_not have_valid(:formation_id).when('') }

  it { should validate_presence_of(:key_id) }
  it { should_not have_valid(:key_id).when('') }

  it { should validate_presence_of(:meter_id) }
  it { should_not have_valid(:meter_id).when('') }

  it { should validate_presence_of(:tempo_id) }
  it { should_not have_valid(:tempo_id).when('') }
end
