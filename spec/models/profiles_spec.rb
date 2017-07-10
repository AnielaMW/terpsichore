require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:user_id) }
  it { should_not have_valid(:user_id).when('') }
end
