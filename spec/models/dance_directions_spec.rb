require 'rails_helper'

RSpec.describe DanceDirection, type: :model do
  it { should belong_to(:dance) }

  # Should it have a validation of sequence if I hope to automate the sequencing?
  it { should validate_presence_of(:sequence) }
  it { should_not have_valid(:sequence).when('') }

  it { should validate_presence_of(:movement) }
  it { should_not have_valid(:movement).when('') }
end
