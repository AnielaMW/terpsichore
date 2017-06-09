require 'rails_helper'

RSpec.describe User, type: :model do
  # it { should have_many(:dances) }
  # it { should have_many(:dance_comments) }

  it { should validate_presence_of(:first_name) }
  it { should_not have_valid(:first_name).when('') }

  it { should validate_presence_of(:last_name) }
  it { should_not have_valid(:last_name).when('') }

  it { should validate_presence_of(:user_name) }
  it { should_not have_valid(:user_name).when('') }
  it { should validate_uniqueness_of(:user_name) }

  it { should validate_presence_of(:email) }
  it { should have_valid(:email).when('me@this.com', 'Us@that.us') }
  it { should_not have_valid(:email).when('', 'me', 'here.com') }


  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
