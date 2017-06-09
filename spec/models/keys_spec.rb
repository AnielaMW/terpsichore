require 'rails_helper'

RSpec.describe Key, type: :model do
  it { should have_many(:dances) }

  it { should validate_presence_of(:name) }
  it { should_not have_valid(:name).when('') }
end
