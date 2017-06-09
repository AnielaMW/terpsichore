require 'rails_helper'

RSpec.describe Mood, type: :model do
  it { should validate_presence_of(:name) }
  it { should_not have_valid(:name).when('') }
end
