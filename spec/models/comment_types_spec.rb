require 'rails_helper'

RSpec.describe CommentType, type: :model do
  it { should have_many(:dance_comments) }

  it { should validate_presence_of(:name) }
  it { should_not have_valid(:name).when('') }

  it { should validate_presence_of(:description) }
  it { should_not have_valid(:description).when('') }
end
