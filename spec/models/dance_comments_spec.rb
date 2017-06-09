require 'rails_helper'

RSpec.describe DanceComment, type: :model do
  it { should belong_to(:dance) }
  it { should belong_to(:comment_type) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:comment) }
  it { should_not have_valid(:comment).when('') }
end
